part of 'practice_detail_cubit.dart';

@freezed
class PracticeDetailState with _$PracticeDetailState {
  const factory PracticeDetailState.initial() = _Initial;

  const factory PracticeDetailState.loading() = _Loading;
  const factory PracticeDetailState.success(PracticeDetailModel m) = _Success;
  const factory PracticeDetailState.error(MainFailure e) = _Error;
}
