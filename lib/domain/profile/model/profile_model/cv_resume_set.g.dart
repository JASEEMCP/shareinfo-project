// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_resume_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CvResumeSet _$CvResumeSetFromJson(Map<String, dynamic> json) => CvResumeSet(
      id: (json['id'] as num?)?.toInt(),
      cv: json['cv'] as String?,
      mediaName: json['media_name'] as String?,
    );

Map<String, dynamic> _$CvResumeSetToJson(CvResumeSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cv': instance.cv,
      'media_name': instance.mediaName,
    };
