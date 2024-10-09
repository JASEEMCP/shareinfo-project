import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'common_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.noInternet() = _NoInternet;
  const factory MainFailure.serverError() = _ServerError;
  const factory MainFailure.clientError() = _ClientError;
  const factory MainFailure.unAuthorized() = _UnAuthorized;
  const factory MainFailure.accessDenied() = _AccessDenied;
}

extension MainFailureX on MainFailure {
  bool get accessDenied => this is _AccessDenied;
  String get errorDescription {
    return when(
      clientError: () => "Connection failed",
      serverError: () => "Something went wrong",
      unAuthorized: () => "Sorry, your session is expired",
      noInternet: () => "Connection failed",
      accessDenied: () => "Access Denied",
    );
  }
}
