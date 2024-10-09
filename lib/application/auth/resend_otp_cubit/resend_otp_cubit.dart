import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/auth/service/auth_service.dart';
import 'package:shareinfo/domain/auth/service/forgot_pwd_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

part 'resend_otp_state.dart';
part 'resend_otp_cubit.freezed.dart';

@injectable
class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ForgotPasswordService _forgotPasswordService;
  final AuthService _authService;
  ResendOtpCubit(this._forgotPasswordService, this._authService)
      : super(const ResendOtpState.timerInitial());

  late Timer _timer;
  bool _isTimerRunning = false;

  //Send otp function
  void startTimer(int duration) async {
    if (_isTimerRunning) {
      _timer.cancel();
    }
    emit(ResendOtpState.timerRunning(duration));
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick < duration) {
          emit(ResendOtpState.timerRunning(duration - timer.tick));
        } else {
          emit(const ResendOtpState.timerInitial());
          _isTimerRunning = false;
          _timer.cancel();
        }
      },
    );
    _isTimerRunning = true;
  }

  void reSendOtp(int duration, String email) async {
    ///prevent handle user press button again when timer is running
    if (!_isTimerRunning) {
      emit(const ResendOtpState.reSendingOtp());
      final result = await _forgotPasswordService.sendOtp(email);
      result.fold(
        (failure) {
          emit(ResendOtpState.error(failure));
          return;
        },
        (success) => emit(const ResendOtpState.reSendOtpSuccess()),
      );
      startTimer(duration);
    }
  }

  void reSendSignUpOtp(int duration, Map<String, dynamic> dataMap) async {
    ///prevent handle user press button again when timer is running
    if (!_isTimerRunning) {
      emit(const ResendOtpState.reSendingOtp());
      final result = await _authService.signUp(
        dataMap['email'],
        dataMap['phone_no'],
        dataMap['first_name'],
      );
      result.fold((failure) {
        emit(ResendOtpState.error(failure));
      }, (success) {
        emit(const ResendOtpState.reSendOtpSuccess());
      });
      startTimer(duration);
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
