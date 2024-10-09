part of 'resend_otp_cubit.dart';

@freezed
class ResendOtpState with _$ResendOtpState {
  const factory ResendOtpState.error(AuthException e) = _Error;
  const factory ResendOtpState.reSendingOtp() = _ReSendingOtp;
  const factory ResendOtpState.timerRunning(int t) = _TimerRunning;
  const factory ResendOtpState.timerInitial() = _TimerInitial;
  const factory ResendOtpState.reSendOtpSuccess() = _ReSendOtpSuccess;
}
