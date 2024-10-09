import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/profile/model/affiliations_model/affiliations_model.dart';
import 'package:shareinfo/domain/profile/model/organization_activity_model/organization_activity_model.dart';
import 'package:shareinfo/domain/profile/model/references_model/references_model.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/domain_list_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_4.dart';

import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: ProfileManageService3)
class ProfileManageRepo3 extends ProfileManageService3 {
  @override
  Future<Either<MainFailure, AffiliationsModel>> getAffiliation(int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageAffiliations}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(AffiliationsModel.fromJson(response.data));
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
  Future<Either<MainFailure, OrganizationActivityModel>>
      getOrganizationActivities(int id) async {
    try {
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.manageOrganizationActivities}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(OrganizationActivityModel.fromJson(response.data));
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
  Future<Either<MainFailure, ReferencesModel>> getReferences(int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageReferences}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(ReferencesModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> updateAffiliation(
    AffiliationsModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageAffiliations}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageAffiliations}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createAffiliations}',
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
  Future<Either<MainFailure, String>> updateOrganizationActivities(
    OrganizationActivityModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageOrganizationActivities}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageOrganizationActivities}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createOrganizationActivities}',
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
  Future<Either<MainFailure, String>> updateReferences(
    ReferencesModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageReferences}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageReferences}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createReferences}',
            data: model.toJson(),
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
  Future<Either<MainFailure, List<DomainListModel>>> getDomainList() async {
    try {
      List<DomainListModel> domainList = [];
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.domainList}');
      if (response.statusCode == RespCode.SUCCESS) {
        domainList = (response.data as List).map(
          (e) {
            return DomainListModel.fromJson(e);
          },
        ).toList();

        return Right(domainList);
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
