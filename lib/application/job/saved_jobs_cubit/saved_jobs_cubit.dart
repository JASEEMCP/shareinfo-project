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

part 'saved_jobs_state.dart';
part 'saved_jobs_cubit.freezed.dart';

@lazySingleton
class SavedJobsCubit extends Cubit<SavedJobsState> {
  final JobService _jobService;
  SavedJobsCubit(this._jobService) : super(const SavedJobsState.initial());
  List<JobCardModel> model = [];

  ///Refresh  jobs
  Future<void> refreshJobList() async {
    emit(const SavedJobsState.loading());
    final result = await _jobService.getSavedJobs('', '');
    result.fold(
      (error) => emit(SavedJobsState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const SavedJobsState.empty());
        }
        emit(SavedJobsState.success(model));
      },
    );
  }

  ///Reload saved   jobs
  Future<void> reloadSavedJob(int index) async {
    //parm set to empty string to get all saved jobs
    model.removeAt(index);
    if (model.isEmpty) {
      return emit(const SavedJobsState.empty());
    }
    emit(const SavedJobsState.initial());
    emit(SavedJobsState.success(model));
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
        emit(const SavedJobsState.initial());
        emit(SavedJobsState.success(model));
        getIt<HomeCubit>().refreshSaveButton(model[index].jobId!);
        getIt<JobListCubit>().refreshSaveButton(model[index].jobId!);
        reloadSavedJob(index);
      },
    );
  }

  ///Get job by type
  Future<void> getJobListWithType(String key, JobQueryType type) async {
    emit(const SavedJobsState.loading());
    if (key.isEmpty) {
      //Return success state if job is empty
      return emit(SavedJobsState.success(model));
    }
    final result = await _jobService.getSavedJobs(key, getQueryType(type));
    result.fold(
      (error) => emit(SavedJobsState.error(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const SavedJobsState.empty());
        }
        model = success;
        emit(SavedJobsState.success(success));
      },
    );
  }

  ///Retrieving job list with type
  Future<void> retrieveJobByApplicationType(JobCategory category) async {
    emit(const SavedJobsState.loading());
    //parm are set to empty string for getting all saved jobs
    final result = await _jobService.getSavedJobs('', '');

    result.fold(
      (error) => emit(SavedJobsState.error(error)),
      (success) {
        List<JobCardModel> tempResult = [];
        switch (category) {
          case JobCategory.campusRecruitment:
            tempResult = success.where((e) => e.isCampus ?? false).toList();
          default:
            tempResult = success.where((e) => !(e.isCampus ?? false)).toList();
        }
        if (tempResult.isEmpty) {
          return emit(const SavedJobsState.empty());
        }
        model = tempResult;
        emit(SavedJobsState.success(tempResult));
      },
    );
  }
}
