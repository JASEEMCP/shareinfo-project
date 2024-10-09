import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/auth/service/forgot_pwd_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

part 'forgot_pwd_state.dart';
part 'forgot_pwd_cubit.freezed.dart';

enum PwdType { option, sendOtp, verifyOtp, resetPwd }

@injectable
class ForgotPwdCubit extends Cubit<ForgotPwdState> {
  final ForgotPasswordService _forgotPasswordService;
  ForgotPwdCubit(this._forgotPasswordService)
      : super(const ForgotPwdState.initial());

  PwdType pwdType = PwdType.option;

//Send otp function
  Future<void> sendOtp(String email, PwdType type) async {
    pwdType = PwdType.option;
    emit(const ForgotPwdState.sendingOtp());
    final result = await _forgotPasswordService.sendOtp(email);
    result.fold(
      (failure) => emit(ForgotPwdState.error(failure)),
      (success) {
        pwdType = type;
        emit(const ForgotPwdState.otpSuccess());
      },
    );
  }

  //Verify otp
  Future<void> verifyOtp(String email, String otp, PwdType type) async {
    emit(const ForgotPwdState.verifyingOtp());
    final result = await _forgotPasswordService.verifyOtp(email, otp);
    result.fold(
      (failure) => emit(ForgotPwdState.error(failure)),
      (success) {
        pwdType = type;
        emit(const ForgotPwdState.otpVerifySuccess());
      },
    );
  }

  //Resetting password
  Future<void> resetPassword(
      String email, String password, PwdType type) async {
    emit(const ForgotPwdState.resettingPassword());
    final result = await _forgotPasswordService.resetPassword(email, password);
    result.fold(
      (failure) => emit(ForgotPwdState.error(failure)),
      //Emit state is success
      (success) {
        pwdType = type;
        emit(const ForgotPwdState.resetPasswordSuccess());
      },
    );
  }
}
