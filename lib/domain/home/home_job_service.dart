import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/job_card_model/home_model.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';

abstract class HomeJobService {
  Future<Either<MainFailure, HomeJobModel>> getJobListWithDomain();
  Future<Either<MainFailure, List<JobCardModel>>> getJobListWithType(
      String type, String queryParm);
  Future<Either<MainFailure, List<JobCardModel>>> getHomeJobList();
}
