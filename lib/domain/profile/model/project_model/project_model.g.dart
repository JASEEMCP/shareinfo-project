// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      id: (json['id'] as num?)?.toInt(),
      programName: json['pname'] as String?,
      role: json['role'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      description: json['description'] as String?,
      media: json['media'] as String?,
      projectUrl: json['project_url'] as String?,
      referenceUrl: json['reference_url'] as String?,
      currentlyDeveloping: json['currently_developing'] as bool?,
      mediaName: json['media_name'] as String?,
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pname': instance.programName,
      'role': instance.role,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'description': instance.description,
      'media': instance.media,
      'project_url': instance.projectUrl,
      'reference_url': instance.referenceUrl,
      'currently_developing': instance.currentlyDeveloping,
      'media_name': instance.mediaName,
    };
