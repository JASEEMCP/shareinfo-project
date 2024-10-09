part of 'applied_job_detail_cubit.dart';

@freezed
class AppliedJobDetailState with _$AppliedJobDetailState {
  const factory AppliedJobDetailState.initial() = _Initial;
  const factory AppliedJobDetailState.loading() = _Loading;
  const factory AppliedJobDetailState.error(MainFailure e) = _Error;
  const factory AppliedJobDetailState.success(AppliedJobModel model) = _Success;
}
