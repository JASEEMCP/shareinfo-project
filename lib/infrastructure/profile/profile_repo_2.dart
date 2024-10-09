import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';

import 'package:shareinfo/domain/profile/model/certificate_model/certificate_model.dart';
import 'package:shareinfo/domain/profile/model/education_model/education_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/cv_resume_set.dart';
import 'package:shareinfo/domain/profile/model/project_model/project_model.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/domain_list_model.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/work_experience_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_2.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: ProfileManageService)
class ProfileManageRepo extends ProfileManageService {
  @override
  Future<Either<MainFailure, CvResumeSet>> getResumeData(int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageCVResume}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(CvResumeSet.fromJson(response.data));
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
  Future<Either<MainFailure, String>> updateResume(
      CvResumeSet model, DioMethodType type) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageCVResume}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageCVResume}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createCVResume}',
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
  Future<Either<MainFailure, WorkExperienceModel>> getWorkExperience(
      int id) async {
    try {
      List<DomainListModel> domainList = [];
      final response = await Future.wait([
        //Retrieving work experience data
        dioClient.dio
            .get('${Env().apiBaseUrl}${ApiEndPoints.manageWorkExperience}$id/'),

        ///Retrieving domain list
        dioClient.dio.get('${Env().apiBaseUrl}${ApiEndPoints.domainList}'),
      ]);
      if (response[0].statusCode == RespCode.SUCCESS ||
          response[1].statusCode == RespCode.SUCCESS) {
        domainList = (response[1].data as List).map(
          (e) {
            return DomainListModel.fromJson(e);
          },
        ).toList();

        ///adding domain list with response
        return Right(
          WorkExperienceModel.fromJson(response[0].data).copyWith(
            domainList: domainList,
          ),
        );
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
  Future<Either<MainFailure, String>> updateWorkExperience(
    WorkExperienceModel model,
    DioMethodType type,
  ) async {
    model = model.copyWith(domain: 13);
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageWorkExperience}${model.id}/',
            data: model.manageDataToJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageWorkExperience}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createWorkExperience}',
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
  Future<Either<MainFailure, EducationModel>> getEducationalInfo(int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageEducation}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(EducationModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> updateEducationInfo(
    EducationModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageEducation}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageEducation}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createEducation}',
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
  Future<Either<MainFailure, ProjectModel>> getProjectInfo(int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageProject}$id/');
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(ProjectModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> updateProjectInfo(
    ProjectModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageProject}${model.id}/',
            data: model.toJson(),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageProject}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createProject}',
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
  Future<Either<MainFailure, CertificateModel>> getCertificateInfo(
      int id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.manageCertificate}$id/');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(CertificateModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> updateCertificateInfo(
    CertificateModel model,
    DioMethodType type,
  ) async {
    Response response;
    try {
      switch (type) {
        case DioMethodType.put:
          response = await dioClient.dio.put(
            '${Env().apiBaseUrl}${ApiEndPoints.manageCertificate}${model.id}/',
            data: jsonEncode(model.toJson()),
          );
          break;
        case DioMethodType.delete:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.manageCertificate}${model.id}/');
          break;
        default:
          response = await dioClient.dio.post(
            '${Env().apiBaseUrl}${ApiEndPoints.createCertificate}',
            data: jsonEncode(model.createDataToJson()),
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
