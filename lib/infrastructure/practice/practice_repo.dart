import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/practice/models/enrolled_detailed_view_model/enrolled_detailed_view_model.dart';
import 'package:shareinfo/domain/practice/models/enrolled_practice_list/enrolled_practice_list.dart';
import 'package:shareinfo/domain/practice/models/enrolled_process_list_model/enrolled_detail/enroll_detail_model.dart';
import 'package:shareinfo/domain/practice/models/enrolled_process_list_model/enrolled_process_list_model.dart';
import 'package:shareinfo/domain/practice/models/practice_detail_model/practice_detail_model.dart';
import 'package:shareinfo/domain/practice/models/practice_list_model/practice_list_model.dart';
import 'package:shareinfo/domain/practice/models/specific_enrolled_process_model/specific_enrolled_process_model.dart';
import 'package:shareinfo/domain/practice/services/practice_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: PracticeService)
class PracticeRepo implements PracticeService {
  @override
  Future<Either<MainFailure, List<PracticeListModel>>> getPracticeList() async {
    try {
      List<PracticeListModel> items = [];

      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.practiceList}');

      if (response.statusCode == RespCode.SUCCESS) {
        items = (response.data as List)
            .map((e) => PracticeListModel.fromJson(e))
            .toList();
        return Right(items);
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
  Future<Either<MainFailure, PracticeDetailModel>> getPracticeDetail(
      String id) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.practiceDetail(id)}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(PracticeDetailModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> enrollPractice(String id) async {
    try {
      final response = await dioClient.dio
          .post('${Env().apiBaseUrl}${ApiEndPoints.enrollPractice(id)}');

      if (response.statusCode == RespCode.NO_CONTENT) {
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
  Future<Either<MainFailure, List<EnrolledPracticeList>>>
      getEnrolledPracticeList() async {
    try {
      List<EnrolledPracticeList> items = [];

      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.enrolledPracticeList}');

      if (response.statusCode == RespCode.SUCCESS) {
        items = (response.data as List)
            .map((e) => EnrolledPracticeList.fromJson(e))
            .toList();
        return Right(items);
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
  Future<Either<MainFailure, EnrollDetailModel>> genEnrolledProcessList(
      String id) async {
    try {
      final response = await Future.wait(
        [
          dioClient.dio.get(
              '${Env().apiBaseUrl}${ApiEndPoints.enrolledProcessList(id)}'),
          dioClient.dio.get(
              '${Env().apiBaseUrl}${ApiEndPoints.detailedEnrolledProcessList(id)}'),
        ],
      );

      if (response[0].statusCode == RespCode.SUCCESS &&
          response[1].statusCode == RespCode.SUCCESS) {
        List<EnrolledProcessListModel> items = (response[0].data as List)
            .map((e) => EnrolledProcessListModel.fromJson(e))
            .toList();
        return Right(
          EnrollDetailModel(
            processList: items,
            enrolledDetail:
                EnrolledDetailedViewModel.fromJson(response[1].data),
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
  Future<Either<MainFailure, SpecificEnrolledProcessModel>>
      getSpecificEnrolledProcessList(String id) async {
    try {
      final response = await dioClient.dio.get(
          '${Env().apiBaseUrl}${ApiEndPoints.specificEnrolledProcessList(id)}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(SpecificEnrolledProcessModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      // Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, String>> submitUrl(
    String processId,
    List<String> processList,
  ) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.submitUrl(processId)}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      // Checking  socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }
}
