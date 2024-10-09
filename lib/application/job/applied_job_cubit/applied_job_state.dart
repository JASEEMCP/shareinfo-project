part of 'applied_job_cubit.dart';

@freezed
class AppliedJobState with _$AppliedJobState {
  const factory AppliedJobState.initial() = _Initial;
  const factory AppliedJobState.loading() = _Loading;
  const factory AppliedJobState.empty() = _Empty;
  const factory AppliedJobState.error(MainFailure e) = _Error;
  const factory AppliedJobState.success(List<AppliedJobModel> model) = _Success;
}

extension AppliedJobStateX on AppliedJobState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
  bool get isEmpty => this is _Empty;
}
