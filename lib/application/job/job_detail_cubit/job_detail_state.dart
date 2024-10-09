part of 'job_detail_cubit.dart';

@freezed
class JobDetailState with _$JobDetailState {
  const factory JobDetailState.initial() = _Initial;
  const factory JobDetailState.loading() = _Loading;
  const factory JobDetailState.error(MainFailure e) = _Error;
  const factory JobDetailState.success(JobDetailModel model) = _Success;
}

extension JobDetailStateX on JobDetailState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
}
