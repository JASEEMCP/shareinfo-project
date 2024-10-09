// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobCardModel _$JobCardModelFromJson(Map<String, dynamic> json) => JobCardModel(
      jobId: json['job_id'] as String?,
      jobTitle: json['job_title'] as String?,
      companyName: json['company_name'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      salaryType: json['salary_type'] as String?,
      minimumSalary: (json['minimum_salary'] as num?)?.toInt(),
      maximumSalary: (json['maximum_salary'] as num?)?.toInt(),
      workingMode: json['working_mode'] as String?,
      isSaved: json['is_saved'] as bool?,
      isCampus: json['is_campus'] as bool?,
      companyLogo: json['company_logo'] as String?,
    );

Map<String, dynamic> _$JobCardModelToJson(JobCardModel instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'location': instance.location,
      'salary_type': instance.salaryType,
      'minimum_salary': instance.minimumSalary,
      'maximum_salary': instance.maximumSalary,
      'working_mode': instance.workingMode,
      'is_saved': instance.isSaved,
      'is_campus': instance.isCampus,
      'company_logo': instance.companyLogo,
    };
