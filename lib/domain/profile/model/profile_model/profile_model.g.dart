// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      email: json['email'] as String?,
      personalInformation: json['personalinformation'] == null
          ? null
          : PersonalInformation.fromJson(
              json['personalinformation'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : SummaryModel.fromJson(json['summary'] as Map<String, dynamic>),
      expectedSalary: json['expectedsalary'] == null
          ? null
          : ExpectedSalaryModel.fromJson(
              json['expectedsalary'] as Map<String, dynamic>),
      workExperienceSet: (json['workexperience_set'] as List<dynamic>?)
          ?.map((e) => WorkExperienceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      educationSet: (json['education_set'] as List<dynamic>?)
          ?.map((e) => EducationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectSet: (json['project_set'] as List<dynamic>?)
          ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      certificationSet: (json['certification_set'] as List<dynamic>?)
          ?.map((e) => CertificateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      volunteeringExperienceSet: (json['volunteeringexperience_set']
              as List<dynamic>?)
          ?.map((e) => VolunteeringExpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      professionalExamSet: (json['professionalexam_set'] as List<dynamic>?)
          ?.map(
              (e) => ProfessionalExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      awardsAchievementSet: (json['awardsachievement_set'] as List<dynamic>?)
          ?.map(
              (e) => AwardAchievementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      seminarTrainingSet: (json['seminartraining_set'] as List<dynamic>?)
          ?.map((e) => SeminarTrainingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      organizationActivitiesSet:
          (json['organizationactivities_set'] as List<dynamic>?)
              ?.map((e) =>
                  OrganizationActivityModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      languageSet: (json['language_set'] as List<dynamic>?)
          ?.map((e) => LanguageSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      skillSet: (json['skill_set'] as List<dynamic>?)
          ?.map((e) => SkillSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      affiliationSet: (json['affiliation_set'] as List<dynamic>?)
          ?.map((e) => AffiliationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      referencesSet: (json['references_set'] as List<dynamic>?)
          ?.map((e) => ReferencesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cvResumeSet: (json['cvresume_set'] as List<dynamic>?)
          ?.map((e) => CvResumeSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentinstitute: json['currentinstitute'] == null
          ? null
          : AcademicInfoModel.fromJson(
              json['currentinstitute'] as Map<String, dynamic>),
      profileCompleted: (json['profile_completion'] as num?)?.toInt(),
      unCompletedField: json['uncompleted_fields'] == null
          ? null
          : UncompletedFields.fromJson(
              json['uncompleted_fields'] as Map<String, dynamic>),
      profilePic: json['profile_pic'] as String?,
    )
      ..fullName = json['full_name'] as String?
      ..currentPosition = json['current_position'] as String?
      ..currentOrganization = json['current_organization'] as String?;

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fullName,
      'profile_pic': instance.profilePic,
      'current_position': instance.currentPosition,
      'profile_completion': instance.profileCompleted,
      'current_organization': instance.currentOrganization,
      'currentinstitute': instance.currentinstitute,
      'personalinformation': instance.personalInformation,
      'summary': instance.summary,
      'expectedsalary': instance.expectedSalary,
      'workexperience_set': instance.workExperienceSet,
      'education_set': instance.educationSet,
      'project_set': instance.projectSet,
      'certification_set': instance.certificationSet,
      'volunteeringexperience_set': instance.volunteeringExperienceSet,
      'professionalexam_set': instance.professionalExamSet,
      'awardsachievement_set': instance.awardsAchievementSet,
      'seminartraining_set': instance.seminarTrainingSet,
      'organizationactivities_set': instance.organizationActivitiesSet,
      'language_set': instance.languageSet,
      'skill_set': instance.skillSet,
      'affiliation_set': instance.affiliationSet,
      'references_set': instance.referencesSet,
      'cvresume_set': instance.cvResumeSet,
      'uncompleted_fields': instance.unCompletedField,
    };
