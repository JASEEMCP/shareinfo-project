import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/home/home_job_service.dart';
import 'package:shareinfo/domain/job/model/job_card_model/home_model.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  final HomeJobService _homeJobService;
  final JobService _jobService;
  HomeCubit(this._homeJobService, this._jobService)
      : super(const HomeState.initial());

  HomeJobModel homeData = HomeJobModel();

  ///Get all jobs
  Future<void> retrieveJobListAndDomain() async {
    if (homeData.domain != null) return;
    emit(const HomeState.initialLoading());

    final result = await _homeJobService.getJobListWithDomain();
    result.fold(
      (error) {
        homeData = HomeJobModel();
        emit(HomeState.error(error));
      },
      (success) {
        homeData = success;
        emit(HomeState.initialSuccess(homeData));
      },
    );
  }

  ///Get all jobs
  Future<void> refreshJobListAndDomain() async {
    emit(const HomeState.initialLoading());

    final result = await _homeJobService.getJobListWithDomain();
    result.fold(
      (error) {
        homeData = HomeJobModel();
        emit(HomeState.error(error));
      },
      (success) {
        homeData = success;
        emit(HomeState.initialSuccess(homeData));
      },
    );
  }

  ///Save jobs
  Future<void> saveJob(String jobId, int index) async {
    final Either<MainFailure, String> result;

    bool isSaved = homeData.jobList?[index].isSaved ?? false;
    bool isCampus = homeData.jobList?[index].isCampus ?? false;

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
        homeData.jobList?[index].isSaved = !isSaved;
        emit(const HomeState.initial());
        emit(HomeState.initialSuccess(homeData));
        getIt<JobListCubit>()
            .refreshSaveButton(homeData.jobList![index].jobId!);
      },
    );
  }

  ///Refresh  save button
  Future<void> refreshSaveButton(String jobId) async {
    if (homeData.jobList?.isEmpty ?? true) return;
    for (int index = 0; index < (homeData.jobList?.length ?? 0); index++) {
      if (homeData.jobList?[index].jobId == jobId) {
        homeData.jobList?[index].isSaved =
            !(homeData.jobList?[index].isSaved ?? true);
        emit(const HomeState.initial());
        emit(HomeState.initialSuccess(homeData));
        break;
      }
    }
  }

  ///Refresh  jobs
  Future<void> refreshJobList() async {
    emit(const HomeState.loading());
    final result = await _homeJobService.getJobListWithDomain();
    result.fold(
      (error) => emit(HomeState.error(error)),
      (success) {
        homeData = success;
        if (homeData.domain!.isEmpty) {
          return emit(const HomeState.empty());
        }
        emit(HomeState.initialSuccess(success));
      },
    );
  }

  ///Clear data
  Future<void> clearData() async {
    homeData = HomeJobModel();
  }

  ///Handle previous error state  returning
  Future<void> rollBackToPreviousState() async {
    if (homeData.jobList == null) return;
    emit(HomeState.initialSuccess(homeData));
  }

  ///Retrieving job list with type
  Future<void> getSuggestedJobList(String queryParm, int index) async {
    final Either<MainFailure, List<JobCardModel>> result;
    emit(const HomeState.loading());

    if (index < 4) {
      result = await _homeJobService.getJobListWithType(
          getQueryType(JobQueryType.workingMode), queryParm);
    } else if (index == -1) {
      result = await _homeJobService.getHomeJobList();
    } else {
      result = await _homeJobService.getJobListWithType(
          getQueryType(JobQueryType.domain), queryParm);
    }
    result.fold(
      (error) => emit(HomeState.suggestionError(error)),
      (success) {
        if (success.isEmpty) {
          return emit(const HomeState.suggestionEmpty());
        }
        homeData.jobList = success;
        emit(HomeState.initialSuccess(homeData));
      },
    );
  }
}
