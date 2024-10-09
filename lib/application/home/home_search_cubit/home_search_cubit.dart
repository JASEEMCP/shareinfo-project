import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/job_types.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/home/home_job_service.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'home_search_state.dart';
part 'home_search_cubit.freezed.dart';

@lazySingleton
class HomeSearchCubit extends Cubit<HomeSearchState> {
  final HomeJobService _homeJobService;
  final JobService _jobService;
  HomeSearchCubit(this._homeJobService, this._jobService)
      : super(const HomeSearchState.initial());
  List<JobCardModel> model = [];

  ///Search jobs
  Future<void> searchJob(String key) async {
    emit(const HomeSearchState.loading());
    if (key.isEmpty) {
      model = [];
      return emit(const HomeSearchState.initial());
    }
    final result = await _homeJobService.getJobListWithType(
        getQueryType(JobQueryType.jobTitle), key);
    result.fold(
      (error) => emit(HomeSearchState.error(error)),
      (success) {
        model = success;
        if (success.isEmpty) {
          return emit(const HomeSearchState.empty());
        }
        emit(HomeSearchState.success(success));
      },
    );
  }

  ///Refresh  save button
  Future<void> refreshSaveButton(String jobId) async {
    if (model.isEmpty) return;
    for (int index = 0; index < model.length; index++) {
      if (model[index].jobId == jobId) {
        model[index].isSaved = !(model[index].isSaved ?? true);
        emit(const HomeSearchState.initial());
        emit(HomeSearchState.success(model));
        break;
      }
    }
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
        emit(const HomeSearchState.initial());
        emit(HomeSearchState.success(model));
        getIt<HomeCubit>().refreshSaveButton(model[index].jobId!);
        getIt<JobListCubit>().refreshSaveButton(model[index].jobId!);
      },
    );
  }

  ///Retrieving job list with type
  Future<void> retrieveJobListWithType(String searchKey) async {
    emit(const HomeSearchState.loading());

    final result = await _homeJobService.getJobListWithType(
        getQueryType(JobQueryType.workingMode), searchKey);
    result.fold(
      (error) => emit(HomeSearchState.error(error)),
      (success) {
        model = success;
        if (success.isEmpty) {
          return emit(const HomeSearchState.empty());
        }
        emit(HomeSearchState.success(success));
      },
    );
  }

  ///Retrieving job list with type
  Future<void> retrieveJobByApplicationType(JobCategory category) async {
    emit(const HomeSearchState.loading());
    final result = await _homeJobService.getHomeJobList();

    result.fold(
      (error) => emit(HomeSearchState.error(error)),
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
          return emit(const HomeSearchState.empty());
        }
        model = tempResult;
        emit(HomeSearchState.success(tempResult));
      },
    );
  }

  //Clear data
  void clearData() {
    model = [];
    emit(const HomeSearchState.initial());
  }
}
