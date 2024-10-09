import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/home/home_cubit/home_cubit.dart';
import 'package:shareinfo/application/job/job_list_cubit/job_list_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'suggested_list_state.dart';
part 'suggested_list_cubit.freezed.dart';

@lazySingleton
class SuggestedListCubit extends Cubit<SuggestedListState> {
  final JobService _jobService;
  SuggestedListCubit(this._jobService)
      : super(const SuggestedListState.initial());
  List<JobCardModel> model = [];

  ///Get all jobs
  Future<void> retrieveJobList() async {
    if (model.isNotEmpty) return;
    emit(const SuggestedListState.loading());

    final result = await _jobService.getAllJobList();
    result.fold(
      (error) => emit(SuggestedListState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const SuggestedListState.empty());
        }
        emit(SuggestedListState.success(model));
      },
    );
  }

  ///Refresh  jobs
  Future<void> refreshJobList() async {
    emit(const SuggestedListState.loading());
    final result = await _jobService.getAllJobList();
    result.fold(
      (error) => emit(SuggestedListState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const SuggestedListState.empty());
        }
        emit(SuggestedListState.success(model));
      },
    );
  }

  ///Save jobs
  Future<void> saveJob(String jobId, int index) async {
    final Either<MainFailure, String> result;

    bool isSaved = model[index].isSaved ?? false;
    bool isCampus = model[index].isCampus ?? false;

    if (isSaved) {
      result = await _jobService.saveJob(
        jobId,
        DioMethodType.delete,
        isCampus,
      );
    } else {
      result = await _jobService.saveJob(
        jobId,
        DioMethodType.post,
        isCampus,
      );
    }

    result.fold(
      (error) => null,
      (success) {
        model[index].isSaved = !isSaved;
        emit(const SuggestedListState.initial());
        emit(SuggestedListState.success(model));
        getIt<HomeCubit>().refreshSaveButton(model[index].jobId!);
        getIt<JobListCubit>().refreshSaveButton(model[index].jobId!);
      },
    );
  }

  ///Search jobs
  Future<void> getJobListWithType(String key, JobQueryType type) async {
    emit(const SuggestedListState.loading());
    if (key.isEmpty) {
      //Return success state if job is empty
      return emit(SuggestedListState.success(model));
    }
    final result =
        await _jobService.getJobListWithType(getQueryType(type), key);
    result.fold(
      (error) => emit(SuggestedListState.error(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const SuggestedListState.empty());
        }
        model = success;
        emit(SuggestedListState.success(success));
      },
    );
  }

  ///Retrieving job list with type
  Future<void> retrieveJobByApplicationType(JobCategory category) async {
    emit(const SuggestedListState.loading());
    final result = await _jobService.getAllJobList();

    result.fold(
      (error) => emit(SuggestedListState.error(error)),
      (success) {
        List<JobCardModel> tempResult = [];
        switch (category) {
          case JobCategory.campusRecruitment:
            tempResult = success.where((e) => e.isCampus ?? false).toList();
          case JobCategory.openRecruitment:
            tempResult = success.where((e) => !(e.isCampus ?? false)).toList();
          default:
            tempResult = success;
        }
        if (tempResult.isEmpty) {
          return emit(const SuggestedListState.empty());
        }
        model = tempResult;
        emit(SuggestedListState.success(tempResult));
      },
    );
  }

  //Clear data
  void clearData() {
    model = [];
    emit(const SuggestedListState.initial());
  }
}
