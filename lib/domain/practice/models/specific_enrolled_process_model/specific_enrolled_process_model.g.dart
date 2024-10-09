// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_enrolled_process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificEnrolledProcessModel _$SpecificEnrolledProcessModelFromJson(
        Map<String, dynamic> json) =>
    SpecificEnrolledProcessModel(
      processId: json['process_id'] as String?,
      practice: (json['practice'] as num?)?.toInt(),
      processName: json['process_name'] as String?,
      taskDescription: (json['task_description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      urls: (json['urls'] as List<dynamic>?)
          ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$SpecificEnrolledProcessModelToJson(
        SpecificEnrolledProcessModel instance) =>
    <String, dynamic>{
      'process_id': instance.processId,
      'practice': instance.practice,
      'process_name': instance.processName,
      'task_description': instance.taskDescription,
      'urls': instance.urls,
      'status': instance.status,
      'isExpanded': instance.isExpanded,
    };
