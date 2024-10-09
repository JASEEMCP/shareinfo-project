// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillSet _$SkillSetFromJson(Map<String, dynamic> json) => SkillSet(
      id: (json['id'] as num?)?.toInt(),
      skill: json['skill'] as String?,
      skillName: json['skill_name'] as String?,
    );

Map<String, dynamic> _$SkillSetToJson(SkillSet instance) => <String, dynamic>{
      'id': instance.id,
      'skill': instance.skill,
      'skill_name': instance.skillName,
    };
