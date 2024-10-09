import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/error_type.dart';
import 'package:shareinfo/domain/common/api/end_points.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/applied_job_model/applied_job_model.dart';
import 'package:shareinfo/domain/job/service/applied_job_service.dart';
import 'package:shareinfo/infrastructure/env/env.dart';
import 'package:shareinfo/presentation/root_widget.dart';

@LazySingleton(as: AppliedJobService)
class AppliedJobRepo implements AppliedJobService {
  @override
  Future<Either<MainFailure, List<AppliedJobModel>>> getAppliedJobList(
      String query) async {
    try {
      List<AppliedJobModel> jobList = [];
      String baseUrl = '';
      if (query.trim().isEmpty) {
        baseUrl = '${Env().apiBaseUrl}${ApiEndPoints.appliedJobList}';
      } else {
        baseUrl =
            '${Env().apiBaseUrl}${ApiEndPoints.appliedJobList}?application_status=$query';
      }
      final response = await dioClient.dio.get(baseUrl);
      if (response.statusCode == RespCode.SUCCESS) {
        jobList = (response.data as List)
            .map(
              (e) => AppliedJobModel.fromJson(e),
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
  Future<Either<MainFailure, List<AppliedJobModel>>> searchAppliedJobList(
      String query) async {
    try {
      List<AppliedJobModel> jobList = [];

      String baseUrl =
          '${Env().apiBaseUrl}${ApiEndPoints.appliedJobList}?job_title=$query';

      final response = await dioClient.dio.get(baseUrl);
      if (response.statusCode == RespCode.SUCCESS) {
        jobList = (response.data as List)
            .map(
              (e) => AppliedJobModel.fromJson(e),
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
  Future<Either<MainFailure, AppliedJobModel>> getAppliedJobDetail(
      String jobId) async {
    try {
      String baseUrl =
          '${Env().apiBaseUrl}${ApiEndPoints.appliedJobDetail}$jobId/';

      final response = await dioClient.dio.get(baseUrl);
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(AppliedJobModel.fromJson(response.data));
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
