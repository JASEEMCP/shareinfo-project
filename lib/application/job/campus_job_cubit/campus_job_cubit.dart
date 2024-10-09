import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'campus_job_state.dart';
part 'campus_job_cubit.freezed.dart';

@lazySingleton
class CampusJobCubit extends Cubit<CampusJobState> {
  final JobService _jobService;
  CampusJobCubit(this._jobService) : super(const CampusJobState.initial());
  List<JobCardModel> model = [];

  ///Get all jobs
  Future<void> retrieveJobList() async {
    if (model.isNotEmpty) return;
    emit(const CampusJobState.loading());

    final result = await _jobService.getCampusJob(
        '', getQueryType(JobQueryType.workingMode));
    result.fold(
      (error) => emit(CampusJobState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const CampusJobState.empty());
        }
        emit(CampusJobState.success(model));
      },
    );
  }

  ///Refresh  jobs
  Future<void> refreshJobList() async {
    emit(const CampusJobState.loading());
    final result = await _jobService.getCampusJob(
        '', getQueryType(JobQueryType.workingMode));
    result.fold(
      (error) => emit(CampusJobState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const CampusJobState.empty());
        }
        emit(CampusJobState.success(model));
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
        emit(const CampusJobState.initial());
        emit(CampusJobState.success(model));
        getIt<HomeCubit>().refreshSaveButton(model[index].jobId!);
        getIt<JobListCubit>().refreshSaveButton(model[index].jobId!);
      },
    );
  }

  ///Search  and types of jobs
  Future<void> getJobListWithType(String key, JobQueryType type) async {
    emit(const CampusJobState.loading());
    if (key.isEmpty) {
      //Return success state if job is empty
      return emit(CampusJobState.success(model));
    }
    final result = await _jobService.getCampusJob(key, getQueryType(type));
    result.fold(
      (error) => emit(CampusJobState.error(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const CampusJobState.empty());
        }
        model = success;
        emit(CampusJobState.success(success));
      },
    );
  }
}
