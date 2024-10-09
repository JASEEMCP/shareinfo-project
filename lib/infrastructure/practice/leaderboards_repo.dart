import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/practice/models/leaderboards_model/leaderboards_model.dart';
import 'package:shareinfo/domain/practice/models/specific_practice_leaderboards/specific_practice_leaderboards.dart';
import 'package:shareinfo/domain/practice/services/leaderboards_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: LeaderboardsService)
class PracticeRepo implements LeaderboardsService {

  /// Leaderboards by type
  @override
  Future<Either<MainFailure, LeaderboardsModel>> getLeaderboards(
      String type) async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.leaderboards(type)}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(LeaderboardsModel.fromJson(response.data));
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
  Future<Either<MainFailure, SpecificPracticeLeaderboards>> getSpecificPracticeLeaderboards(String id)async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.specificPracticeLeaderboards(id)}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(SpecificPracticeLeaderboards.fromJson(response.data));
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
