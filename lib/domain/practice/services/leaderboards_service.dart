



import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/practice/models/leaderboards_model/leaderboards_model.dart';
import 'package:shareinfo/domain/practice/models/specific_practice_leaderboards/specific_practice_leaderboards.dart';

abstract class LeaderboardsService {


  Future<Either<MainFailure, LeaderboardsModel>> getLeaderboards(String type);

  Future<Either<MainFailure, SpecificPracticeLeaderboards>> getSpecificPracticeLeaderboards(String id);
}