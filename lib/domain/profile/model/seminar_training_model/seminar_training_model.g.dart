// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seminar_training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeminarTrainingModel _$SeminarTrainingModelFromJson(
        Map<String, dynamic> json) =>
    SeminarTrainingModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      organisation: json['organisation'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SeminarTrainingModelToJson(
        SeminarTrainingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'organisation': instance.organisation,
      'date': instance.date,
      'description': instance.description,
    };
