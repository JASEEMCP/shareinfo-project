part of 'enrolled_process_list_cubit.dart';

@freezed
class EnrolledProcessListState with _$EnrolledProcessListState {
  const factory EnrolledProcessListState.initial() = _Initial;

  const factory EnrolledProcessListState.loading() = _Loading;
  const factory EnrolledProcessListState.success(EnrollDetailModel m) =
      _Success;
  const factory EnrolledProcessListState.error(MainFailure e) = _Error;
}

extension EnrolledProcessListStateX on EnrolledProcessListState{
  bool get isSuccess => this is _Success;
}
