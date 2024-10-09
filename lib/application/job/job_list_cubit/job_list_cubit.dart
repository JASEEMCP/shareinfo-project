import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/home/home_cubit/home_cubit.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'job_list_state.dart';
part 'job_list_cubit.freezed.dart';

@lazySingleton
class JobListCubit extends Cubit<JobListState> {
  final JobService _jobService;
  JobListCubit(this._jobService) : super(const JobListState.initial());
  List<JobCardModel> model = [];

  ///Get all jobs
  Future<void> retrieveJobList() async {
    if (model.isNotEmpty) return;
    emit(const JobListState.loading());

    final result = await _jobService.getAllJobList();
    result.fold(
      (error) => emit(JobListState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const JobListState.empty());
        }
        emit(JobListState.success(model));
      },
    );
  }

  ///Refresh  jobs
  Future<void> refreshJobList() async {
    emit(const JobListState.loading());
    final result = await _jobService.getAllJobList();
    result.fold(
      (error) => emit(JobListState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const JobListState.empty());
        }
        emit(JobListState.success(model));
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
        emit(const JobListState.initial());
        emit(JobListState.success(model));
        getIt<HomeCubit>().refreshSaveButton(model[index].jobId!);
      },
    );
  }

  ///Refresh  save button
  Future<void> refreshSaveButton(String jobId) async {
    if (model.isEmpty) return;
    for (int index = 0; index < model.length; index++) {
      if (model[index].jobId == jobId) {
        model[index].isSaved = !(model[index].isSaved ?? true);
        emit(const JobListState.initial());
        emit(JobListState.success(model));
        break;
      }
    }
  }

  ///Search jobs
  Future<void> getJobListWithType(String key, JobQueryType type) async {
    emit(const JobListState.loading());
    if (key.isEmpty) {
      //Return success state if job is empty
      return emit(JobListState.success(model));
    }
    final result =
        await _jobService.getJobListWithType(getQueryType(type), key);
    result.fold(
      (error) => emit(JobListState.error(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const JobListState.empty());
        }
        model = success;
        emit(JobListState.success(success));
      },
    );
  }

  ///Retrieving job list with type
  Future<void> retrieveJobByApplicationType(JobCategory category) async {
    emit(const JobListState.loading());
    final result = await _jobService.getAllJobList();

    result.fold(
      (error) => emit(JobListState.error(error)),
      (success) {
        List<JobCardModel> tempResult = [];
        switch (category) {
          case JobCategory.campusRecruitment:
            tempResult = success.where((e) => e.isCampus ?? false).toList();
          default:
            tempResult = success.where((e) => !(e.isCampus ?? false)).toList();
        }
        if (tempResult.isEmpty) {
          return emit(const JobListState.empty());
        }
        model = tempResult;
        emit(JobListState.success(tempResult));
      },
    );
  }

  void clearJobList() {
    model = [];
    emit(const JobListState.initial());
  }
}
