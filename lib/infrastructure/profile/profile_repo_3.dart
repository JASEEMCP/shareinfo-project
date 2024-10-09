import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/profile/model/award_achievement_model/award_achievement_model.dart';
import 'package:shareinfo/domain/profile/model/professional_exam_model/professional_exam_model.dart';
import 'package:shareinfo/domain/profile/model/seminar_training_model/seminar_training_model.dart';
import 'package:shareinfo/domain/profile/model/volunteering_exp_model/volunteering_exp_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_3.dart';

import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: ProfileManageService2)
class ProfileMRepo2 extends ProfileManageService2 {
  @override
  Future<Either<MainFailure, AwardAchievementModel>> getAwardAchievement(
      int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageAwardAchievement}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(AwardAchievementModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, ProfessionalExamModel>> getProfessionalExamInfo(
      int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageProfessionalExam}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(ProfessionalExamModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, SeminarTrainingModel>> getSeminarTraining(
      int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageSeminarTraining}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(SeminarTrainingModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, VolunteeringExpModel>> getVolunteeringExp(
      int id) async {
    try {
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.manageVolunteeringExperience}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(VolunteeringExpModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, String>> updateAwardAchievement(
    AwardAchievementModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageAwardAchievement}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageAwardAchievement}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createAwardAchievement}',
            data: model.createDataToJson(),
          );
          break;
      }

      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == RespCode.NO_CONTENT) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, String>> updateProfessionalExamInfo(
    ProfessionalExamModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageProfessionalExam}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageProfessionalExam}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createProfessionalExam}',
            data: model.createDataToJson(),
          );
          break;
      }

      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == RespCode.NO_CONTENT) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, String>> updateSeminarTraining(
    SeminarTrainingModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageSeminarTraining}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageSeminarTraining}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createSeminarTraining}',
            data: model.createDataToJson(),
          );
          break;
      }

      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == RespCode.NO_CONTENT) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, String>> updateVolunteeringExp(
    VolunteeringExpModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageVolunteeringExperience}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageVolunteeringExperience}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createVolunteeringExperience}',
            data: model.createDataToJson(),
          );
          break;
      }
      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == RespCode.NO_CONTENT) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }
}
