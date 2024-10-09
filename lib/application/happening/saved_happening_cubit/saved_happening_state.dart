part of 'saved_happening_cubit.dart';

@freezed
class SavedHappeningState with _$SavedHappeningState {
  const factory SavedHappeningState.initial() = _Initial;

  const factory SavedHappeningState.loading() = _Loading;
  const factory SavedHappeningState.error(MainFailure e) = _Error;
  const factory SavedHappeningState.empty() = _Empty;
  const factory SavedHappeningState.success(List<HappeningModel> model) =
      _Success;
}
