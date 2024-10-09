import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/error_type.dart';
import 'package:shareinfo/domain/auth/model/aspirational_list_model/aspirational_list_model.dart';
import 'package:shareinfo/domain/auth/model/institute_data/institute_data.dart';
import 'package:shareinfo/domain/auth/model/institute_list_model/institute_list_model/institute_list_model.dart';
import 'package:shareinfo/domain/auth/model/pre_profile_model/pre_profile_model.dart';
import 'package:shareinfo/domain/auth/service/pre_profile_service.dart';
import 'package:shareinfo/domain/common/api/end_points.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/root_widget.dart';

@LazySingleton(as: PreProfileService)
class PreProfileRepo extends PreProfileService {
  @override
  Future<Either<AuthException, List<InstituteListModel>>>
      getInstituteList() async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.instituteList}');

      List<InstituteListModel> items = [];

      if (response.statusCode == RespCode.SUCCESS) {
        items = (response.data as List)
            .map((e) => InstituteListModel.fromJson(e))
            .toList();
        items.insert(0, InstituteListModel(id: null, fullName: 'Other'));
        return Right(items);
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
  Future<Either<AuthException, Map<String, dynamic>>> submitPreProfile(
      PreProfileModel model,
      {required bool isStudent}) async {
    try {
      Response response;
      if (isStudent) {
        response = await dioClient.dio.post(
          '${Env().apiBaseUrl}${ApiEndPoints.preProfileSuccess}',
          data: model.toJson(),
        );
      } else {
        response = await dioClient.dio.post(
          '${Env().apiBaseUrl}${ApiEndPoints.preProfileSuccess}',
          data: model.nonStudentModel(),
        );
      }
      if (response.statusCode == RespCode.NO_CONTENT) {
        return Right(response.data);
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
  Future<Either<AuthException, List<InstituteListModel>>> searchInstitute(
      String searchQuery) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.instituteList}');

      List<InstituteListModel> items = [];
      List<InstituteListModel> searchList = [];
      if (response.statusCode == RespCode.SUCCESS) {
        items = (response.data as List)
            .map((e) => InstituteListModel.fromJson(e))
            .toList();
        items.insert(0, InstituteListModel(id: null, fullName: 'Other'));
        searchList = items.where(
          (element) {
            return element.fullName!
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
          },
        ).toList();

        return Right(searchList);
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
  Future<Either<AuthException, List<AspirationalListModel>>>
      getAspirationField() async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.aspiration}');

      List<AspirationalListModel> items = [];

      if (response.statusCode == RespCode.SUCCESS) {
        items = (response.data as List)
            .map((e) => AspirationalListModel.fromJson(e))
            .toList();

        return Right(items);
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
  Future<Either<AuthException, InstituteData>> getDepartmentList(
      int instituteId) async {
    try {
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.departmentList}$instituteId/');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(InstituteData.fromJson(response.data));
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
  Future<Either<AuthException, List<AspirationalListModel>>> searchAspiration(
      String searchQuery) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.aspiration}');

      List<AspirationalListModel> items = [];
      List<AspirationalListModel> searchList = [];
      if (response.statusCode == RespCode.SUCCESS) {
        items = (response.data as List)
            .map((e) => AspirationalListModel.fromJson(e))
            .toList();

        searchList = items.where(
          (element) {
            return element.aspirationalField!
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
          },
        ).toList();

        return Right(searchList);
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
}
