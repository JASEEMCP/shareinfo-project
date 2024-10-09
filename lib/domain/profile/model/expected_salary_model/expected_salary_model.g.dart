// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expected_salary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpectedSalaryModel _$ExpectedSalaryModelFromJson(Map<String, dynamic> json) =>
    ExpectedSalaryModel(
      minimumFulltime: (json['minimum_fulltime'] as num?)?.toInt(),
      maximumFulltime: (json['maximum_fulltime'] as num?)?.toInt(),
      minimumInternship: (json['minimum_internship'] as num?)?.toInt(),
      maximumInternship: (json['maximum_internship'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      frequency: json['frequency'] as String?,
    );

Map<String, dynamic> _$ExpectedSalaryModelToJson(
        ExpectedSalaryModel instance) =>
    <String, dynamic>{
      'minimum_fulltime': instance.minimumFulltime,
      'maximum_fulltime': instance.maximumFulltime,
      'minimum_internship': instance.minimumInternship,
      'maximum_internship': instance.maximumInternship,
      'currency': instance.currency,
      'frequency': instance.frequency,
    };
