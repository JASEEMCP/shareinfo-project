// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_process_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledProcessListModel _$EnrolledProcessListModelFromJson(
        Map<String, dynamic> json) =>
    EnrolledProcessListModel(
      id: json['process_id'] as String?,
      processName: json['process_name'] as String?,
      taskDescription: (json['task_description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      specificProcessDetail: json['specificProcessDetail'] == null
          ? null
          : SpecificEnrolledProcessModel.fromJson(
              json['specificProcessDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnrolledProcessListModelToJson(
        EnrolledProcessListModel instance) =>
    <String, dynamic>{
      'process_id': instance.id,
      'process_name': instance.processName,
      'task_description': instance.taskDescription,
      'status': instance.status,
      'specificProcessDetail': instance.specificProcessDetail,
    };
