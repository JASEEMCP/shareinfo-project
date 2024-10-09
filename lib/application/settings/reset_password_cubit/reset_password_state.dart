part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.resettingPassword() = _ResettingPassword;
  const factory ResetPasswordState.error(AuthException e) = _Error;
  const factory ResetPasswordState.success() = _Success;
}

extension ResetPasswordStateX on ResetPasswordState {
  bool get isLoading => this is _ResettingPassword;
}
