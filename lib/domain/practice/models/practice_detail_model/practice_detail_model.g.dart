// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PracticeDetailModel _$PracticeDetailModelFromJson(Map<String, dynamic> json) =>
    PracticeDetailModel(
      id: json['id'] as String?,
      bannerImage: json['banner_image'] as String?,
      practiceTask: json['practice_task'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      subCategories: (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      objective: json['objective'] as String?,
      overview: json['overview'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => ProcessStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEnroll: json['is_enroll'] as bool?,
    );

Map<String, dynamic> _$PracticeDetailModelToJson(
        PracticeDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'banner_image': instance.bannerImage,
      'practice_task': instance.practiceTask,
      'description': instance.description,
      'category': instance.category,
      'sub_categories': instance.subCategories,
      'objective': instance.objective,
      'overview': instance.overview,
      'steps': instance.steps,
      'is_enroll': instance.isEnroll,
    };
