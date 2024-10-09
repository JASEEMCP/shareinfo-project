import 'package:json_annotation/json_annotation.dart';
import 'package:shareinfo/domain/profile/model/academic_info_model/academic_info_model.dart';
import 'package:shareinfo/domain/profile/model/affiliations_model/affiliations_model.dart';
import 'package:shareinfo/domain/profile/model/award_achievement_model/award_achievement_model.dart';
import 'package:shareinfo/domain/profile/model/certificate_model/certificate_model.dart';
import 'package:shareinfo/domain/profile/model/education_model/education_model.dart';
import 'package:shareinfo/domain/profile/model/expected_salary_model/expected_salary_model.dart';
import 'package:shareinfo/domain/profile/model/organization_activity_model/organization_activity_model.dart';
import 'package:shareinfo/domain/profile/model/professional_exam_model/professional_exam_model.dart';
import 'package:shareinfo/domain/profile/model/project_model/project_model.dart';
import 'package:shareinfo/domain/profile/model/references_model/references_model.dart';
import 'package:shareinfo/domain/profile/model/seminar_training_model/seminar_training_model.dart';
import 'package:shareinfo/domain/profile/model/un_completed_profile_field/uncompleted_fields.dart';
import 'package:shareinfo/domain/profile/model/volunteering_exp_model/volunteering_exp_model.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/work_experience_model.dart';

import 'cv_resume_set.dart';
import 'language_set.dart';
import 'personal_information.dart';
import 'skill_set.dart';
import 'summary_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String? email;
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "profile_pic")
  String? profilePic;
  @JsonKey(name: "current_position")
  String? currentPosition;
  @JsonKey(name: "profile_completion")
  int? profileCompleted;
  @JsonKey(name: "current_organization")
  String? currentOrganization;
  AcademicInfoModel? currentinstitute;
  @JsonKey(name: 'personalinformation')
  PersonalInformation? personalInformation;
  SummaryModel? summary;
  @JsonKey(name: 'expectedsalary')
  ExpectedSalaryModel? expectedSalary;
  @JsonKey(name: 'workexperience_set')
  List<WorkExperienceModel>? workExperienceSet;
  @JsonKey(name: 'education_set')
  List<EducationModel>? educationSet;
  @JsonKey(name: 'project_set')
  List<ProjectModel>? projectSet;
  @JsonKey(name: 'certification_set')
  List<CertificateModel>? certificationSet;
  @JsonKey(name: 'volunteeringexperience_set')
  List<VolunteeringExpModel>? volunteeringExperienceSet;
  @JsonKey(name: 'professionalexam_set')
  List<ProfessionalExamModel>? professionalExamSet;
  @JsonKey(name: 'awardsachievement_set')
  List<AwardAchievementModel>? awardsAchievementSet;
  @JsonKey(name: 'seminartraining_set')
  List<SeminarTrainingModel>? seminarTrainingSet;
  @JsonKey(name: 'organizationactivities_set')
  List<OrganizationActivityModel>? organizationActivitiesSet;
  @JsonKey(name: 'language_set')
  List<LanguageSet>? languageSet;
  @JsonKey(name: 'skill_set')
  List<SkillSet>? skillSet;
  @JsonKey(name: 'affiliation_set')
  List<AffiliationsModel>? affiliationSet;
  @JsonKey(name: 'references_set')
  List<ReferencesModel>? referencesSet;
  @JsonKey(name: 'cvresume_set')
  List<CvResumeSet>? cvResumeSet;
  @JsonKey(name: 'uncompleted_fields')
  UncompletedFields? unCompletedField;

  ProfileModel({
    this.email,
    this.personalInformation,
    this.summary,
    this.expectedSalary,
    this.workExperienceSet,
    this.educationSet,
    this.projectSet,
    this.certificationSet,
    this.volunteeringExperienceSet,
    this.professionalExamSet,
    this.awardsAchievementSet,
    this.seminarTrainingSet,
    this.organizationActivitiesSet,
    this.languageSet,
    this.skillSet,
    this.affiliationSet,
    this.referencesSet,
    this.cvResumeSet,
    this.currentinstitute,
    this.profileCompleted,
    this.unCompletedField,
    this.profilePic,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
