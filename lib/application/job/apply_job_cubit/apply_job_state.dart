part of 'apply_job_cubit.dart';

@freezed
class ApplyJobState with _$ApplyJobState {
  const factory ApplyJobState.initial() = _Initial;
  const factory ApplyJobState.loading() = _Loading;
  const factory ApplyJobState.error(MainFailure e) = _Error;
  const factory ApplyJobState.success() = _Success;
}

extension ApplyJobStateX on ApplyJobState {
  bool get isApplying => this is _Loading;
  bool get applySuccess => this is _Success;
  bool get isError => this is _Error;
}
