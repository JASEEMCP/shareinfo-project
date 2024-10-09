import 'package:dartz/dartz.dart';
import 'package:shareinfo/application/job/apply_job_cubit/apply_job_cubit.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';
import 'package:shareinfo/domain/job/model/job_detail_model/job_detail_model.dart';

abstract class JobService {
  Future<Either<MainFailure, List<JobCardModel>>> getAllJobList();
  Future<Either<MainFailure, List<JobCardModel>>> getJobListWithType(
      String type, String queryParm);
  Future<Either<MainFailure, String>> saveJob(
      String jobId, DioMethodType type, bool isCampus);

  Future<Either<MainFailure, JobDetailModel>> getJobDetail(String jobId);

  Future<Either<MainFailure, String>> applyJob(ApplyJobModel model);

  Future<Either<MainFailure, List<JobCardModel>>> getCampusJob(
      String query, String type);

  Future<Either<MainFailure, List<JobCardModel>>> getSavedJobs(
      String query, String type);
}
