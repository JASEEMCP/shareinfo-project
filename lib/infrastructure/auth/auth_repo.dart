import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/error_type.dart';
import 'package:shareinfo/domain/common/api/dio_cookie_manager.dart';
import 'package:shareinfo/domain/common/api/end_points.dart';
import 'package:shareinfo/domain/auth/service/auth_service.dart';
import 'package:shareinfo/domain/auth/model/token_model.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/root_widget.dart';

// To store session ID
//List? sessionCookie = [];

@LazySingleton(as: AuthService)
class AuthRepo extends AuthService {
  // To store FCM ID if user is logging on web-app

  /// Dio instance
  final DioCookieManger dio = DioCookieManger();

  //Login
  @override
  Future<Either<AuthException, Token>> login(
      String email, String password) async {
    try {
      final response = await Dio().post(
        '${Env().apiBaseUrl}${ApiEndPoints.login}',
        data: {
          'email': email,
          'password': password,
          'fcm_token': null,
        },
      );
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(Token.fromJson(response.data));
      } else {
        return const Left(AuthException.unAuthorized());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.type == DioExceptionType.connectionError ||
          exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode == RespCode.BAD_REQUEST) {
        return const Left(AuthException.wrongEmailOrPassword());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  ///Refreshing token
  @override
  Future<Either<AuthException, Token>> refresh(String refreshToken) async {
    try {
      final response = await Dio().post(
        '${Env().apiBaseUrl}${ApiEndPoints.refresh}',
        data: {
          'refresh': refreshToken,
        },
      );
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(Token.fromJson(response.data));
      } else {
        return const Left(AuthException.unAuthorized());
      }
    } on DioException {
      return const Left(AuthException.unAuthorized());
    }
  }

  @override
  Future<Either<AuthException, Token>> createPassword(String password) async {
    try {
      final response = await dio.dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.createPassword}',
        data: {
          'password': password,

          /// This [user_type] value is default for candidate login
          'user_type': 'Candidate',
          'fcm_token': null,
        },
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(Token.fromJson(response.data));
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode ==
          RespCode.INTERNAL_SERVER_ERROR) {
        return const Left(AuthException.sessionExpired());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, String>> logout(String refreshToken) async {
    try {
      final response = await dioClient.dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.logout}',
        data: {
          'refresh_token': refreshToken,
          'fcm_token': null,
        },
      );

      if (response.statusCode == RespCode.RESET_CONTENT) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, String>> otpVerify(String otp) async {
    try {
      final response = await dio.dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.signUpOtpVerify}',
        data: {
          'otp': otp,
        },
      );
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode == RespCode.BAD_REQUEST) {
        return const Left(AuthException.invalidOtp());
      } else if (exception.response?.statusCode ==
          RespCode.INTERNAL_SERVER_ERROR) {
        return const Left(AuthException.sessionExpired());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, String>> signUp(
      String email, String phoneNumber, String firstName) async {
    try {
      final response = await dio.dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.signUp}',
        data: {
          'email': email,
          'phone_no': phoneNumber,
          'first_name': firstName,
        },
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode == RespCode.BAD_REQUEST) {
        return const Left(AuthException.userAlreadyExist());
      } else if (exception.response?.statusCode ==
          RespCode.INTERNAL_SERVER_ERROR) {
        return const Left(AuthException.sessionExpired());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }
}
