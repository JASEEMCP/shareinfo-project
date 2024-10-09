import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/domain/job/model/applied_job_model/applied_job_model.dart';
import 'package:shareinfo/domain/job/service/applied_job_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'applied_job_state.dart';
part 'applied_job_cubit.freezed.dart';

@lazySingleton
class AppliedJobCubit extends Cubit<AppliedJobState> {
  final AppliedJobService _appliedJobService;
  AppliedJobCubit(this._appliedJobService)
      : super(const AppliedJobState.initial());

  List<AppliedJobModel> model = [];

  ///Refresh  jobs
  Future<void> refreshAppliedJobList() async {
    emit(const AppliedJobState.loading());
    final result = await _appliedJobService.getAppliedJobList('');
    result.fold(
      (error) => emit(AppliedJobState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const AppliedJobState.empty());
        }
        emit(AppliedJobState.success(model));
      },
    );
  }

  ///Refresh  jobs
  Future<void> getAppliedJobList() async {
    if (model.isNotEmpty) return;
    emit(const AppliedJobState.loading());
    final result = await _appliedJobService.getAppliedJobList('');
    result.fold(
      (error) => emit(AppliedJobState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const AppliedJobState.empty());
        }
        emit(AppliedJobState.success(model));
      },
    );
  }

  ///Applied job for show deactivate account screen
  Future<void> getAppliedJobInDeactivateAccount() async {
    if (model.isNotEmpty) return;
    emit(const AppliedJobState.loading());
    final result = await _appliedJobService.getAppliedJobList('');
    result.fold(
      (error) => emit(AppliedJobState.error(error)),
      (success) {
        model = success;
        emit(AppliedJobState.success(model));
      },
    );
  }

  void clearData() {
    model = [];
    emit(const AppliedJobState.initial());
  }

  ///types of applied jobs
  Future<void> getAppliedJobListWithType(String key) async {
    emit(const AppliedJobState.loading());
    if (key.isEmpty) {
      //Return success state if job is empty
      return emit(AppliedJobState.success(model));
    }
    final result = await _appliedJobService.getAppliedJobList(key);
    result.fold(
      (error) => emit(AppliedJobState.error(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const AppliedJobState.empty());
        }
        model = success;
        emit(AppliedJobState.success(success));
      },
    );
  }

  ///types of applied jobs
  Future<void> searchAppliedJob(String key) async {
    emit(const AppliedJobState.loading());
    if (key.isEmpty) {
      return emit(AppliedJobState.success(model));
    }
    final result = await _appliedJobService.searchAppliedJobList(key);
    result.fold(
      (error) => emit(AppliedJobState.error(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const AppliedJobState.empty());
        }
        emit(AppliedJobState.success(success));
      },
    );
  }

  ///Retrieving job list with type
  Future<void> retrieveAppliedJobByApplicationType(JobCategory category) async {
    emit(const AppliedJobState.loading());
    final result = await _appliedJobService.getAppliedJobList('');

    result.fold(
      (error) => emit(AppliedJobState.error(error)),
      (success) {
        List<AppliedJobModel> tempResult = [];
        switch (category) {
          case JobCategory.campusRecruitment:
            tempResult = success.where((e) => e.isCampus ?? false).toList();
          default:
            tempResult = success.where((e) => !(e.isCampus ?? false)).toList();
        }
        if (tempResult.isEmpty) {
          return emit(const AppliedJobState.empty());
        }
        model = tempResult;
        emit(AppliedJobState.success(tempResult));
      },
    );
  }
}
