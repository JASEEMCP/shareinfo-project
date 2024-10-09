// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkExperienceModel _$WorkExperienceModelFromJson(Map<String, dynamic> json) =>
    WorkExperienceModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      company: json['company'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      description: json['description'] as String?,
      employmentType: json['employment_type'] as String?,
      location: json['location'] as String?,
      jobLevel: json['job_level'] as String?,
      domain: json['domain'],
      recentSalary: (json['recent_salary'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      media: json['media'] as String?,
      currentlyWorking: json['currently_working'] as bool?,
      domainList: (json['domainList'] as List<dynamic>?)
          ?.map((e) => DomainListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      domainId: (json['domainId'] as num?)?.toInt(),
      mediaName: json['media_name'] as String?,
    );

Map<String, dynamic> _$WorkExperienceModelToJson(
        WorkExperienceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company': instance.company,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'description': instance.description,
      'employment_type': instance.employmentType,
      'location': instance.location,
      'job_level': instance.jobLevel,
      'domain': instance.domain,
      'domainId': instance.domainId,
      'recent_salary': instance.recentSalary,
      'currency': instance.currency,
      'media': instance.media,
      'currently_working': instance.currentlyWorking,
      'domainList': instance.domainList,
      'media_name': instance.mediaName,
    };
