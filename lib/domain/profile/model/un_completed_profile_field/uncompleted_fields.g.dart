// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uncompleted_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UncompletedFields _$UncompletedFieldsFromJson(Map<String, dynamic> json) =>
    UncompletedFields(
      isPersonalInformationFilled:
          json['is_personal_information_filled'] as bool?,
      isCurrentInstituteFilled: json['is_current_institute_filled'] as bool?,
      isEducationFilled: json['is_education_filled'] as bool?,
      isSkillFilled: json['is_skill_filled'] as bool?,
      isLanguageFilled: json['is_language_filled'] as bool?,
      isCvResumeFilled: json['is_cv_resume_filled'] as bool?,
    );

Map<String, dynamic> _$UncompletedFieldsToJson(UncompletedFields instance) =>
    <String, dynamic>{
      'is_personal_information_filled': instance.isPersonalInformationFilled,
      'is_current_institute_filled': instance.isCurrentInstituteFilled,
      'is_education_filled': instance.isEducationFilled,
      'is_skill_filled': instance.isSkillFilled,
      'is_language_filled': instance.isLanguageFilled,
      'is_cv_resume_filled': instance.isCvResumeFilled,
    };
