// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageSet _$LanguageSetFromJson(Map<String, dynamic> json) => LanguageSet(
      id: (json['id'] as num?)?.toInt(),
      language: json['language'] as String?,
      proficiency: json['proficiency'] as String?,
    );

Map<String, dynamic> _$LanguageSetToJson(LanguageSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'proficiency': instance.proficiency,
    };
