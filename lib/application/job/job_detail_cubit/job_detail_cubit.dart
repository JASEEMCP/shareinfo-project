import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/job_detail_model/job_detail_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'job_detail_state.dart';
part 'job_detail_cubit.freezed.dart';

@lazySingleton
class JobDetailCubit extends Cubit<JobDetailState> {
  final JobService _jobService;
  JobDetailCubit(this._jobService) : super(const JobDetailState.initial());

  JobDetailModel model = JobDetailModel();
  Future<void> getJobDetail(String jobId) async {
    emit(const JobDetailState.loading());

    final result = await _jobService.getJobDetail(jobId);

    result.fold(
      (error) => emit(JobDetailState.error(error)),
      (success) {
        model = success;
        emit(JobDetailState.success(success));
      },
    );
  }

  ///Save jobs
  Future<void> saveJob(String jobId) async {
    final Either<MainFailure, String> result;

    bool isSaved = model.isSaved ?? false;
    bool isCampus = model.isCampus ?? false;

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
        model.isSaved = !isSaved;
        emit(const JobDetailState.initial());
        emit(JobDetailState.success(model));

        ///Refreshing every job screen save button state
        getIt<HomeCubit>().refreshSaveButton(model.jobId!);
        getIt<JobListCubit>().refreshSaveButton(model.jobId!);
        getIt<HomeSearchCubit>().refreshSaveButton(model.jobId!);
      },
    );
  }
}
