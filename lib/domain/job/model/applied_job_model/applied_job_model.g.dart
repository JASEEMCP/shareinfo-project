// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedJobModel _$AppliedJobModelFromJson(Map<String, dynamic> json) =>
    AppliedJobModel(
      jobId: json['job_id'] as String?,
      jobTitle: json['job_title'] as String?,
      salaryType: json['salary_type'] as String?,
      minimumSalary: (json['minimum_salary'] as num?)?.toInt(),
      maximumSalary: (json['maximum_salary'] as num?)?.toInt(),
      workingMode: json['working_mode'] as String?,
      companyName: json['company_name'] as String?,
      isSaved: json['is_saved'] as bool?,
      isCampus: json['is_campus'] as bool?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      applicationStatus: json['application_status'] as String?,
      applicationCount: (json['application_count'] as num?)?.toInt(),
      instituteName: json['institute_name'] as String?,
      recruiterMail: json['recruiter_mail'] as String?,
      companyLogo: json['company_logo'] as String?,
    );

Map<String, dynamic> _$AppliedJobModelToJson(AppliedJobModel instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
      'job_title': instance.jobTitle,
      'salary_type': instance.salaryType,
      'minimum_salary': instance.minimumSalary,
      'maximum_salary': instance.maximumSalary,
      'working_mode': instance.workingMode,
      'company_name': instance.companyName,
      'recruiter_mail': instance.recruiterMail,
      'institute_name': instance.instituteName,
      'is_saved': instance.isSaved,
      'is_campus': instance.isCampus,
      'location': instance.location,
      'application_status': instance.applicationStatus,
      'application_count': instance.applicationCount,
      'company_logo': instance.companyLogo,
    };
