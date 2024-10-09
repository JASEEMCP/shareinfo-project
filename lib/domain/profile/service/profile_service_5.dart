import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/academic_info_model/academic_info_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/language_set.dart';
import 'package:shareinfo/domain/profile/model/profile_model/skill_set.dart';

abstract class ProfileManageService4 {
  Future<Either<MainFailure, List<SkillSet>>> getSkills();
  Future<Either<MainFailure, List<SkillSet>>> searchSkill(String q);
  Future<Either<MainFailure, String>> addSkill(int id, DioMethodType type);

  Future<Either<MainFailure, LanguageSet>> getLanguages(int id);
  Future<Either<MainFailure, String>> addLanguage(
    LanguageSet model,
    DioMethodType type,
  );

  Future<Either<MainFailure, AcademicInfoModel>> getAcademicInfo(
      AcademicInfoModel? model, DioMethodType type);
}
