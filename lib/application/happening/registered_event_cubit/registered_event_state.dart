part of 'registered_event_cubit.dart';

@freezed
class RegisteredEventState with _$RegisteredEventState {
  const factory RegisteredEventState.initial() = _Initial;

  const factory RegisteredEventState.loading() = _Loading;
  const factory RegisteredEventState.error(MainFailure e) = _Error;
  const factory RegisteredEventState.empty() = _Empty;
  const factory RegisteredEventState.success(List<HappeningModel> model) =
      _Success;
}
