import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/error_type.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/api/end_points.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/academic_info_model/academic_info_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/language_set.dart';
import 'package:shareinfo/domain/profile/model/profile_model/skill_set.dart';
import 'package:shareinfo/domain/profile/service/profile_service_5.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/root_widget.dart';

@LazySingleton(as: ProfileManageService4)
class ProfileRepo5 extends ProfileManageService4 {
  @override
  Future<Either<MainFailure, String>> addLanguage(
      LanguageSet model, DioMethodType type) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageLanguage}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageLanguage}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createLanguage}',
            data: LanguageSet(
              proficiency: model.proficiency,
              language: model.language,
            ).toJson(),
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
  Future<Either<MainFailure, String>> addSkill(
      int id, DioMethodType type) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageSkill}',
            data: {"skill": "[$id]"},
          );
          break;
        default:
          response = await dioClient.dio
              .delete('${Env().apiBaseUrl}${ApiEndPoints.deleteSkill}$id/');
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
  Future<Either<MainFailure, LanguageSet>> getLanguages(int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageLanguage}$id/');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(LanguageSet.fromJson(response.data));
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
  Future<Either<MainFailure, List<SkillSet>>> getSkills() async {
    try {
      List<SkillSet> skillList = [];
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageSkill}');
      if (response.statusCode == RespCode.SUCCESS) {
        skillList = (response.data as List)
            .map(
              (e) => SkillSet.fromJson(e),
            )
            .toList();
        return Right(skillList);
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
  Future<Either<MainFailure, List<SkillSet>>> searchSkill(String q) async {
    List<SkillSet> skillList = [];
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.skillList}$q');
      if (response.statusCode == RespCode.SUCCESS) {
        skillList = (response.data as List)
            .map(
              (e) => SkillSet.fromJson(e),
            )
            .toList();
        return Right(skillList);
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
  Future<Either<MainFailure, AcademicInfoModel>> getAcademicInfo(
      AcademicInfoModel? model, DioMethodType type) async {
    try {
      Response response;
      switch (type) {
        case DioMethodType.get:
          response = await dioClient.dio.get(
            '${Env().apiBaseUrl}${ApiEndPoints.currentInstitute}',
          );
          break;
        default:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.currentInstitute}',
            data: model!.updateDataToJson(),
          );
          break;
      }

      if (response.statusCode == RespCode.SUCCESS ||
          response.statusCode == RespCode.NO_CONTENT) {
        if (type == DioMethodType.put) {
          return Right(AcademicInfoModel());
        }
        return Right(AcademicInfoModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }
}
