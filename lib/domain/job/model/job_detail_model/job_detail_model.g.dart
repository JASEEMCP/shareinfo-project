// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetailModel _$JobDetailModelFromJson(Map<String, dynamic> json) =>
    JobDetailModel(
      jobId: json['job_id'] as String?,
      companyLogo: json['company_logo'] as String?,
      jobTitle: json['job_title'] as String?,
      companyName: json['company_name'] as String?,
      instituteName: json['institute_name'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      salaryType: json['salary_type'] as String?,
      minimumSalary: (json['minimum_salary'] as num?)?.toInt(),
      maximumSalary: (json['maximum_salary'] as num?)?.toInt(),
      workingMode: json['working_mode'] as String?,
      recruitmentStartDate: json['recruitment_start_date'] as String?,
      recruitmentEndDate: json['recruitment_end_date'] as String?,
      jobDescription: (json['job_description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiredQualities: (json['required_qualities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perksBenefits: (json['perks_benefits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiredSkills: (json['required_skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      minCgpa: (json['min_cgpa'] as num?)?.toDouble(),
      backPapers: (json['back_papers'] as num?)?.toInt(),
      jobLevel: json['job_level'] as String?,
      jobCategory: json['job_category'] as String?,
      noOfVacancies: (json['no_of_vacancies'] as num?)?.toInt(),
      domain: json['domain'] as String?,
      supportMail: json['support_mail'] as String?,
      companyWebsite: json['company_website'] as String?,
      educationalQualification: json['educational_qualification'] as String?,
      experienceType: json['experience_type'] as String?,
      isApplied: json['is_applied'] as bool?,
      isCampus: json['is_campus'] as bool?,
      referenceWebsite: json['reference_website'] as String?,
      isSaved: json['is_saved'] as bool?,
      minQualification: (json['min_qualification'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobDetailModelToJson(JobDetailModel instance) =>
    <String, dynamic>{
      'educational_qualification': instance.educationalQualification,
      'min_qualification': instance.minQualification,
      'experience_type': instance.experienceType,
      'job_id': instance.jobId,
      'company_logo': instance.companyLogo,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'institute_name': instance.instituteName,
      'location': instance.location,
      'salary_type': instance.salaryType,
      'minimum_salary': instance.minimumSalary,
      'maximum_salary': instance.maximumSalary,
      'working_mode': instance.workingMode,
      'recruitment_start_date': instance.recruitmentStartDate,
      'recruitment_end_date': instance.recruitmentEndDate,
      'job_description': instance.jobDescription,
      'required_qualities': instance.requiredQualities,
      'perks_benefits': instance.perksBenefits,
      'required_skills': instance.requiredSkills,
      'min_cgpa': instance.minCgpa,
      'back_papers': instance.backPapers,
      'job_level': instance.jobLevel,
      'job_category': instance.jobCategory,
      'no_of_vacancies': instance.noOfVacancies,
      'domain': instance.domain,
      'support_mail': instance.supportMail,
      'company_website': instance.companyWebsite,
      'reference_website': instance.referenceWebsite,
      'is_campus': instance.isCampus,
      'is_applied': instance.isApplied,
      'is_saved': instance.isSaved,
    };
