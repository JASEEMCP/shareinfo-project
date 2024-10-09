// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PracticeListModel _$PracticeListModelFromJson(Map<String, dynamic> json) =>
    PracticeListModel(
      id: json['practice_id'] as String?,
      practiceTask: json['practice_task'] as String?,
      perks: (json['perks'] as num?)?.toInt(),
      description: json['description'] as String?,
      isEnroll: json['is_enroll'] as bool?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$PracticeListModelToJson(PracticeListModel instance) =>
    <String, dynamic>{
      'practice_id': instance.id,
      'practice_task': instance.practiceTask,
      'perks': instance.perks,
      'description': instance.description,
      'is_enroll': instance.isEnroll,
      'category': instance.category,
    };
