part of 'forgot_pwd_cubit.dart';

@freezed
class ForgotPwdState with _$ForgotPwdState {
  const factory ForgotPwdState.initial() = _Initial;
  const factory ForgotPwdState.sendingOtp() = _SendingOtp;
  const factory ForgotPwdState.verifyingOtp() = _VerifyingOtp;
  const factory ForgotPwdState.resettingPassword() = _ResettingPassword;
  const factory ForgotPwdState.otpSuccess() = _OtpSuccess;
  const factory ForgotPwdState.otpVerifySuccess() = _OtpVerifySuccess;
  const factory ForgotPwdState.resetPasswordSuccess() = _ResetPasswordSuccess;
  const factory ForgotPwdState.error(AuthException e) = _Error;
}

extension ForgotPwdStateX on ForgotPwdState {
  bool get isSending => this is _SendingOtp;
  bool get isVerifying => this is _VerifyingOtp;
  bool get isResetting => this is _ResettingPassword;
  bool get isOtpSuccess => this is _OtpSuccess;
}
