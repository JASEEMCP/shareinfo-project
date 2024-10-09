part of 'event_preview_cubit.dart';

@freezed
class EventPreviewState with _$EventPreviewState {
  const factory EventPreviewState.initial() = _Initial;

  const factory EventPreviewState.loading() = _Loading;
  const factory EventPreviewState.error(MainFailure e) = _Error;
  const factory EventPreviewState.success(HappeningModel model) = _Success;
}

extension EventPreviewStateX on EventPreviewState {
  bool get isError => this is _Error;
  bool get isLoading => this is _Loading;
}
