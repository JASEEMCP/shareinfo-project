part of 'campus_job_cubit.dart';

@freezed
class CampusJobState with _$CampusJobState {
  const factory CampusJobState.initial() = _Initial;
  const factory CampusJobState.loading() = _Loading;
  const factory CampusJobState.empty() = _Empty;
  const factory CampusJobState.error(MainFailure e) = _Error;
  const factory CampusJobState.success(List<JobCardModel> model) = _Success;
}

extension CampusJobStateX on CampusJobState {
  bool get isLoading => this is _Loading;
}
