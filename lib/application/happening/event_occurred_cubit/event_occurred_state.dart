part of 'event_occurred_cubit.dart';

@freezed
class EventOccurredState with _$EventOccurredState {
  const factory EventOccurredState.initial() = _Initial;

  const factory EventOccurredState.loading() = _Loading;
  const factory EventOccurredState.error(MainFailure e) = _Error;
  const factory EventOccurredState.empty() = _Empty;
  const factory EventOccurredState.success(List<HappeningModel> model) =
      _Success;
}
