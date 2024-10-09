import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: HappeningService)
class HappeningRepo implements HappeningService {
  @override
  Future<Either<MainFailure, HappeningModel>> getEventDetail(
      String eventId) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.happeningDetail}$eventId/');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(HappeningModel.fromJson(response.data));
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
  Future<Either<MainFailure, List<HappeningModel>>> getHappeningList(
      String? query, String endPoint) async {
    try {
      Response response;
      List<HappeningModel> eventList = [];
      if (query != null) {
        /// Search end point / For searching
        response = await dioClient.dio.get(
            '${Env().apiBaseUrl}${ApiEndPoints.happeningList}$endPoint/?query=$query');
      }

      /// Happening list / For listing with type
      else {
        response = await dioClient.dio
            .get('${Env().apiBaseUrl}${ApiEndPoints.happeningList}$endPoint/');
      }

      if (response.statusCode == RespCode.SUCCESS) {
        eventList = (response.data as List)
            .map(
              (e) => HappeningModel.fromJson(e),
            )
            .toList();
        return Right(eventList);
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
  Future<Either<MainFailure, HappeningModel>> getHappeningPreview(
      String eventId) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.happeningPreview}$eventId/');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(HappeningModel.fromJson(response.data));
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
  Future<Either<MainFailure, String>> registerHappening(String eventId) async {
    try {
      final response = await dioClient.dio.post(
          '${Env().apiBaseUrl}${ApiEndPoints.happeningRegister}$eventId/');

      if (response.statusCode == RespCode.NO_CONTENT) {
        return const Right('Successfully Registered');
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
  Future<Either<MainFailure, String>> saveEvent(
      String eventId, bool isSaved) async {
    try {
      Response response;
      if (isSaved) {
        response = await dioClient.dio.delete(
            '${Env().apiBaseUrl}${ApiEndPoints.saveHappening}$eventId/');
      } else {
        response = await dioClient.dio
            .post('${Env().apiBaseUrl}${ApiEndPoints.saveHappening}$eventId/');
      }

      if (response.statusCode == RespCode.NO_CONTENT ||
          response.statusCode == RespCode.SUCCESS) {
        return const Right('Successfully saved');
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
  Future<Either<MainFailure, String>> sentFeedBack(
      String eventId, int rate, String feedbackText) async {
    try {
      final response = await dioClient.dio.put(
        '${Env().apiBaseUrl}${ApiEndPoints.happeningFeedback}$eventId/',
        data: {
          'rating': rate,
          'feedback': feedbackText,
        },
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return const Right('Feedback sent success');
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
