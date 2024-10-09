part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.logging() = _Logging;
  const factory LoginState.authorized() = _Authorized;
  const factory LoginState.authError(AuthException e) = _AuthError;
  const factory LoginState.signUp() = _SignUp;
  const factory LoginState.signUpSuccess() = _SignUpSuccess;
  const factory LoginState.verifyingOtp() = _VerifyingOtp;
  const factory LoginState.otpVerifySuccess() = _OtpVerifySuccess;
  const factory LoginState.creatingPassword() = _CreatingPassword;
  const factory LoginState.redirectToPreProfile() = _RedirectToPreProfile;
  const factory LoginState.logout() = _Logout;
  const factory LoginState.logoutSuccess() = _LogoutSuccess;
}

extension LoginStateX on LoginState {
  bool get isLoading => this is _Logging;
  bool get isError => this is _AuthError;
  bool get isSigningUp => this is _SignUp;
  bool get isVerifying => this is _VerifyingOtp;
  bool get isCreatingPassword => this is _CreatingPassword;
}
