// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstituteData _$InstituteDataFromJson(Map<String, dynamic> json) =>
    InstituteData(
      cgpaScale: (json['cgpa_scale'] as num?)?.toInt(),
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InstituteDataToJson(InstituteData instance) =>
    <String, dynamic>{
      'cgpa_scale': instance.cgpaScale,
      'departments': instance.departments,
    };
