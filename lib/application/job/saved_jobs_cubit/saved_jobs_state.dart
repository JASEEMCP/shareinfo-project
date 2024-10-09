part of 'saved_jobs_cubit.dart';

@freezed
class SavedJobsState with _$SavedJobsState {
  const factory SavedJobsState.initial() = _Initial;
  const factory SavedJobsState.loading() = _Loading;
  const factory SavedJobsState.empty() = _Empty;
  const factory SavedJobsState.error(MainFailure e) = _Error;
  const factory SavedJobsState.success(List<JobCardModel> model) = _Success;
}
