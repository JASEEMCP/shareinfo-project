// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessStep _$ProcessStepFromJson(Map<String, dynamic> json) => ProcessStep(
      id: json['id'] as String?,
      stepName: json['step_name'] as String?,
      stepDescription: (json['step_description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProcessStepToJson(ProcessStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'step_name': instance.stepName,
      'step_description': instance.stepDescription,
    };
