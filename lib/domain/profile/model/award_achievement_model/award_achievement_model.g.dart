// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwardAchievementModel _$AwardAchievementModelFromJson(
        Map<String, dynamic> json) =>
    AwardAchievementModel(
      id: (json['id'] as num?)?.toInt(),
      topic: json['topic'] as String?,
      organisation: json['organisation'] as String?,
      dateConducted: json['date_conducted'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AwardAchievementModelToJson(
        AwardAchievementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'organisation': instance.organisation,
      'date_conducted': instance.dateConducted,
      'description': instance.description,
    };
