part of 'job_list_cubit.dart';

@freezed
class JobListState with _$JobListState {
  const factory JobListState.initial() = _Initial;
  const factory JobListState.loading() = _Loading;
  const factory JobListState.empty() = _Empty;
  const factory JobListState.error(MainFailure e) = _Error;
  const factory JobListState.success(List<JobCardModel> model) = _Success;
}
