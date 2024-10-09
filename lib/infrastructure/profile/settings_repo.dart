import 'package:dartz/dartz.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/auth/model/personal_information_model/personal_information_model.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/domain/profile/service/settings_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: SettingsService)
class SettingsRepo extends SettingsService {
  @override
  Future<Either<AuthException, String>> resetPassword(
      String oldPassword, String newPassword) async {
    try {
      final response = await dioClient.dio.post(
        '${Env().apiBaseUrl}${ApiEndPoints.resetPassword}',
        data: {
          'new_password': newPassword,
          'old_password': oldPassword,
        },
      );
      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == RespCode.NO_CONTENT) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      } else if (exception.response?.statusCode == RespCode.BAD_REQUEST) {
        return const Left(AuthException.invalidPassword());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, PersonalInformationModel>>
      getPersonalInformation() async {
    try {
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.settingsPersonalInformation}');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(PersonalInformationModel.fromJson(response.data));
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
  Future<Either<AuthException, String>> deactivateAccount(
      SubmissionData data) async {
    try {
      final response = await dioClient.dio.post(
          '${Env().apiBaseUrl}${ApiEndPoints.deactivationSubmission}',
          data: {
            'password': data.password,
            'reason':
                '${encryptedUserName1(auth.authInfo.value.email ?? 'user-dec')}:${data.reason}',
            'refresh_token': auth.authInfo.value.refreshToken,
          });
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      }
      if (exception.response?.statusCode == 400) {
        return const Left(AuthException.invalidPassword());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, String>> deleteAccount(
      DeleteAccountModel model) async {
    try {
      final response = await dioClient.dio
          .post('${Env().apiBaseUrl}${ApiEndPoints.deleteAccount}', data: {
        'password': model.password,
        'reason':
            '${encryptedUserName1(auth.authInfo.value.email ?? 'user-dl')}:${model.reason}',
        'refresh_token': model.refreshToken,
      });
      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == 201) {
        return Right(response.data.toString());
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      }
      if (exception.response?.statusCode == 400) {
        return const Left(AuthException.invalidPassword());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }

  @override
  Future<Either<AuthException, int>> getProfileCompletionPercentage() async {
    try {
      final response = await dioClient.dio.get(
        '${Env().apiBaseUrl}${ApiEndPoints.profileCompletionPercentage}',
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data['completion_rate']);
      } else {
        return const Left(AuthException.unknown());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(AuthException.noInternet());
      }
      if (exception.response?.statusCode == 400) {
        return const Left(AuthException.invalidPassword());
      } else {
        return const Left(AuthException.serverError());
      }
    }
  }
}
