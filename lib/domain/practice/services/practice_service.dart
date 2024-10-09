import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/practice/models/enrolled_practice_list/enrolled_practice_list.dart';
import 'package:shareinfo/domain/practice/models/enrolled_process_list_model/enrolled_detail/enroll_detail_model.dart';
import 'package:shareinfo/domain/practice/models/practice_detail_model/practice_detail_model.dart';
import 'package:shareinfo/domain/practice/models/practice_list_model/practice_list_model.dart';
import 'package:shareinfo/domain/practice/models/specific_enrolled_process_model/specific_enrolled_process_model.dart';

abstract class PracticeService {
  Future<Either<MainFailure, List<PracticeListModel>>> getPracticeList();

  Future<Either<MainFailure, PracticeDetailModel>> getPracticeDetail(String id);

  Future<Either<MainFailure, String>> enrollPractice(String id);

  Future<Either<MainFailure, List<EnrolledPracticeList>>>
      getEnrolledPracticeList();

  Future<Either<MainFailure, EnrollDetailModel>> genEnrolledProcessList(
      String id);

  Future<Either<MainFailure, SpecificEnrolledProcessModel>>
      getSpecificEnrolledProcessList(String id);

  Future<Either<MainFailure, String>> submitUrl(
      String processId, List<String> processList);
}
