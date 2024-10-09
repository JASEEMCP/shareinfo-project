import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException.serverError() = _ServerError;
  const factory AuthException.unAuthorized() = _UnAuthorized;
  const factory AuthException.wrongEmailOrPassword() = _WrongEmailOrPassword;
  const factory AuthException.unknown() = _Unknown;
  const factory AuthException.noInternet() = _NoInternet;
  const factory AuthException.userAlreadyExist() = _UserAlreadyExist;
  const factory AuthException.invalidOtp() = _InvalidOtp;
  const factory AuthException.invalidPassword() = _InvalidPassword;
  const factory AuthException.userDoesNotExist() = _UserDoesNotExist;
  const factory AuthException.sessionExpired() = _SessionExpired;
  const factory AuthException.uploadFailed() = _UploadFailed;
}

extension AuthExceptionX on AuthException {
  String get errorDescription {
    return when(
        uploadFailed: () => 'Failed to Upload Student ID',
        sessionExpired: () => 'Session expired',
        serverError: () => "Something went wrong",
        unAuthorized: () => "Sorry, your session is expired",
        wrongEmailOrPassword: () => "Invalid username or password",
        unknown: () => "Something went wrong",
        noInternet: () => "Sorry, there's problem with your network connection",
        userAlreadyExist: () => "Username or phone number is already taken",
        invalidOtp: () => 'Please enter valid OTP',
        invalidPassword: () => 'Password is Incorrect',
        userDoesNotExist: () =>
            'The email you entered does not match any registered account');
  }
}
