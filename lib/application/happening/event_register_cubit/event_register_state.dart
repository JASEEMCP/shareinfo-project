part of 'event_register_cubit.dart';

@freezed
class EventRegisterState with _$EventRegisterState {
  const factory EventRegisterState.initial() = _Initial;

  const factory EventRegisterState.registering() = _Registering;
  const factory EventRegisterState.error(MainFailure e) = _Error;
  const factory EventRegisterState.success() = _Success;
}

extension EventRegisterStateX on EventRegisterState {
  bool get isLoading => this is _Registering;
}
