import 'package:dartz/dartz.dart';
import 'package:shareinfo/application/job/apply_job_cubit/apply_job_cubit.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/model/job_detail_model/job_detail_model.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: JobService)
class JobRepo extends JobService {
  @override
  Future<Either<MainFailure, List<JobCardModel>>> getAllJobList() async {
    try {
      List<JobCardModel> jobList = [];
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.showAllJobList}');
      if (response.statusCode == RespCode.SUCCESS) {
        jobList = (response.data as List)
            .map(
              (e) => JobCardModel.fromJson(e),
            )
            .toList();

        return Right(jobList);
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
  Future<Either<MainFailure, List<JobCardModel>>> getJobListWithType(
      String type, String queryParm) async {
    try {
      List<JobCardModel> jobList = [];
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.showAllJobList}?$type=$queryParm');
      if (response.statusCode == RespCode.SUCCESS) {
        jobList = (response.data as List)
            .map(
              (e) => JobCardModel.fromJson(e),
            )
            .toList();
        return Right(jobList);
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
  Future<Either<MainFailure, String>> saveJob(
      String jobId, DioMethodType type, bool isCampus) async {
    try {
      Response response;
      switch (type) {
        case DioMethodType.post:
          response = await dioClient.dio
              .post('${Env().apiBaseUrl}${ApiEndPoints.saveJob}$jobId/', data: {
            'is_campus': isCampus,
          });
          break;
        default:
          response = await dioClient.dio.delete(
              '${Env().apiBaseUrl}${ApiEndPoints.saveJob}$jobId/',
              data: {
                'is_campus': isCampus,
              });
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
  Future<Either<MainFailure, List<JobCardModel>>> getCampusJob(
      String query, String type) async {
    try {
      List<JobCardModel> jobList = [];
      String baseUrl = '';
      if (query.trim().isEmpty) {
        baseUrl = '${Env().apiBaseUrl}${ApiEndPoints.campusJob}';
      } else {
        baseUrl = '${Env().apiBaseUrl}${ApiEndPoints.campusJob}?$type=$query';
      }
      final response = await dioClient.dio.get(baseUrl);
      if (response.statusCode == RespCode.SUCCESS) {
        jobList = (response.data as List)
            .map(
              (e) => JobCardModel.fromJson(e),
            )
            .toList();
        return Right(jobList);
      } else {
        if (response.statusCode == 204) {
          return const Left(MainFailure.accessDenied());
        }
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
  Future<Either<MainFailure, List<JobCardModel>>> getSavedJobs(
      String query, String type) async {
    try {
      List<JobCardModel> jobList = [];
      String baseUrl = '';
      if (query.trim().isEmpty) {
        baseUrl = '${Env().apiBaseUrl}${ApiEndPoints.savedJobList}';
      } else {
        baseUrl =
            '${Env().apiBaseUrl}${ApiEndPoints.savedJobList}?$type=$query';
      }
      final response = await dioClient.dio.get(baseUrl);
      if (response.statusCode == RespCode.SUCCESS) {
        jobList = (response.data as List)
            .map(
              (e) => JobCardModel.fromJson(e),
            )
            .toList();
        return Right(jobList);
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
  Future<Either<MainFailure, JobDetailModel>> getJobDetail(String jobId) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.jobDetail}$jobId/');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(JobDetailModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> applyJob(ApplyJobModel model) async {
    try {
      final response = await dioClient.dio.post(
          '${Env().apiBaseUrl}${ApiEndPoints.applyJob}${model.jobId}/',
          data: {
            'is_campus': model.isCampus,
          });
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
