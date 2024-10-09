part of 'practice_list_cubit.dart';

@freezed
class PracticeListState with _$PracticeListState {
  const factory PracticeListState.initial() = _Initial;

  const factory PracticeListState.loading() = _Loading;
  const factory PracticeListState.success(List<PracticeListModel> m) = _Success;
  const factory PracticeListState.error(MainFailure e) = _Error;
}
