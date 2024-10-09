part of 'enrolled_practice_list_cubit.dart';

@freezed
class EnrolledPracticeListState with _$EnrolledPracticeListState {
  const factory EnrolledPracticeListState.initial() = _Initial;

  const factory EnrolledPracticeListState.loading() = _Loading;

  const factory EnrolledPracticeListState.success(
      List<EnrolledPracticeList> m) = _Success;

  const factory EnrolledPracticeListState.error(MainFailure e) = _Error;
}
