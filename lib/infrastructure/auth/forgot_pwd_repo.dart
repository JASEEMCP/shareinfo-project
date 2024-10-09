import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/error_type.dart';
import 'package:shareinfo/domain/auth/service/forgot_pwd_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/infrastructure/env/env.dart';

import '../../domain/common/api/end_points.dart';

@LazySingleton(as: ForgotPasswordService)
class ForgotPasswordRepo extends ForgotPasswordService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Env().apiBaseUrl,
    receiveTimeout: const Duration(seconds: 60),
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  ));
  @override
  Future<Either<AuthException, String>> resetPassword(
      String email, String password) async {
    try {
      final response = await dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.forgotPassword}',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.serverError());
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
  Future<Either<AuthException, String>> sendOtp(String email) async {
    try {
      final response = await dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.forgotPasswordOtpSend}',
        data: {
          'email': email,
        },
      );
      return Right(response.data.toString());
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode == RespCode.BAD_REQUEST) {
        return const Left(AuthException.userDoesNotExist());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, String>> verifyOtp(
      String email, String otp) async {
    try {
      final response = await dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.forgotPasswordOtpVerify}',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      return Right(response.data.toString());
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode == RespCode.BAD_REQUEST) {
        return const Left(AuthException.invalidOtp());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }
}
