// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    EducationModel(
      id: (json['id'] as num?)?.toInt(),
      institute: json['institute'] as String?,
      educationalAttainment: json['educational_attainment'] as String?,
      course: json['course'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      gpa: (json['gpa'] as num?)?.toDouble(),
      scale: (json['scale'] as num?)?.toInt(),
      description: json['description'] as String?,
      media: json['media'] as String?,
      currentlyStudying: json['currently_studying'] as bool?,
      mediaName: json['media_name'] as String?,
    );

Map<String, dynamic> _$EducationModelToJson(EducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'institute': instance.institute,
      'educational_attainment': instance.educationalAttainment,
      'course': instance.course,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'gpa': instance.gpa,
      'scale': instance.scale,
      'description': instance.description,
      'media': instance.media,
      'currently_studying': instance.currentlyStudying,
      'media_name': instance.mediaName,
    };
