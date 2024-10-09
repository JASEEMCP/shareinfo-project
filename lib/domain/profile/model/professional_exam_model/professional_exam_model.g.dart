// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionalExamModel _$ProfessionalExamModelFromJson(
        Map<String, dynamic> json) =>
    ProfessionalExamModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      scale: (json['scale'] as num?)?.toInt(),
      dateOfIssue: json['date_of_issue'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProfessionalExamModelToJson(
        ProfessionalExamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'score': instance.score,
      'scale': instance.scale,
      'date_of_issue': instance.dateOfIssue,
      'description': instance.description,
    };
