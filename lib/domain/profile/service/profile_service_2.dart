import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/certificate_model/certificate_model.dart';
import 'package:shareinfo/domain/profile/model/education_model/education_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/cv_resume_set.dart';
import 'package:shareinfo/domain/profile/model/project_model/project_model.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/work_experience_model.dart';

abstract class ProfileManageService {
  Future<Either<MainFailure, CvResumeSet>> getResumeData(int id);
  Future<Either<MainFailure, String>> updateResume(
    CvResumeSet model,
    DioMethodType type,
  );

  Future<Either<MainFailure, WorkExperienceModel>> getWorkExperience(int id);
  Future<Either<MainFailure, String>> updateWorkExperience(
    WorkExperienceModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, EducationModel>> getEducationalInfo(int id);
  Future<Either<MainFailure, String>> updateEducationInfo(
    EducationModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, ProjectModel>> getProjectInfo(int id);
  Future<Either<MainFailure, String>> updateProjectInfo(
    ProjectModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, CertificateModel>> getCertificateInfo(int id);
  Future<Either<MainFailure, String>> updateCertificateInfo(
    CertificateModel model,
    DioMethodType type,
  );
}
