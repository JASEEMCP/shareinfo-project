import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/home/home_job_service.dart';
import 'package:shareinfo/domain/job/model/job_card_model/home_model.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: HomeJobService)
class HomeRepo extends HomeJobService {
  @override
  Future<Either<MainFailure, HomeJobModel>> getJobListWithDomain() async {
    try {
      List<JobCardModel> jobList = [];
      List<String> domainList = [];
      final response = await Future.wait([
        dioClient.dio.get('${Env().apiBaseUrl}${ApiEndPoints.jobList}'),
        dioClient.dio.get('${Env().apiBaseUrl}${ApiEndPoints.homeDomainList}'),
      ]);
      if (response[0].statusCode == RespCode.SUCCESS &&
          response[1].statusCode == RespCode.SUCCESS) {
        jobList = (response[0].data as List)
            .map(
              (e) => JobCardModel.fromJson(e),
            )
            .toList();
        for (var x in response[1].data) {
          domainList.add(x);
        }
        return Right(
          HomeJobModel(jobList: jobList, domain: domainList),
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
  Future<Either<MainFailure, List<JobCardModel>>> getJobListWithType(
      String type, String queryParm) async {
    try {
      List<JobCardModel> jobList = [];
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.jobList}?$type=$queryParm');
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

  Future<Either<MainFailure, List<JobCardModel>>> searchJob(
      String searchKey) async {
    try {
      List<JobCardModel> jobList = [];
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.jobList}?job_title=$searchKey');
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
  Future<Either<MainFailure, List<JobCardModel>>> getHomeJobList() async {
    try {
      List<JobCardModel> jobList = [];
      final response =
          await dioClient.dio.get('${Env().apiBaseUrl}${ApiEndPoints.jobList}');

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
}
