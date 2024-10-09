import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/applied_job_model/applied_job_model.dart';

abstract class AppliedJobService {
  Future<Either<MainFailure, List<AppliedJobModel>>> getAppliedJobList(
      String query);
  Future<Either<MainFailure, List<AppliedJobModel>>> searchAppliedJobList(
      String query);

  Future<Either<MainFailure, AppliedJobModel>> getAppliedJobDetail(
      String jobId);
}
