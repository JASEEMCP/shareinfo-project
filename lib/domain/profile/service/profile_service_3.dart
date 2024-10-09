import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/award_achievement_model/award_achievement_model.dart';
import 'package:shareinfo/domain/profile/model/professional_exam_model/professional_exam_model.dart';
import 'package:shareinfo/domain/profile/model/seminar_training_model/seminar_training_model.dart';
import 'package:shareinfo/domain/profile/model/volunteering_exp_model/volunteering_exp_model.dart';

abstract class ProfileManageService2 {
  Future<Either<MainFailure, VolunteeringExpModel>> getVolunteeringExp(int id);
  Future<Either<MainFailure, String>> updateVolunteeringExp(
    VolunteeringExpModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, ProfessionalExamModel>> getProfessionalExamInfo(
      int id);
  Future<Either<MainFailure, String>> updateProfessionalExamInfo(
    ProfessionalExamModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, AwardAchievementModel>> getAwardAchievement(
      int id);
  Future<Either<MainFailure, String>> updateAwardAchievement(
    AwardAchievementModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, SeminarTrainingModel>> getSeminarTraining(int id);
  Future<Either<MainFailure, String>> updateSeminarTraining(
    SeminarTrainingModel model,
    DioMethodType type,
  );
}
