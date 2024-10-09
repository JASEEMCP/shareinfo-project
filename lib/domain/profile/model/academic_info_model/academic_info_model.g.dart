// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicInfoModel _$AcademicInfoModelFromJson(Map<String, dynamic> json) =>
    AcademicInfoModel(
      currentInstitute: json['current_institute'] as String?,
      stream: json['stream'] as String?,
      startDate: (json['start_date'] as num?)?.toInt(),
      endDate: (json['end_date'] as num?)?.toInt(),
      currentSemester: json['current_semester'] as String?,
      cgpa: (json['cgpa'] as num?)?.toDouble(),
      scale: (json['scale'] as num?)?.toInt(),
      backlogs: (json['backlogs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AcademicInfoModelToJson(AcademicInfoModel instance) =>
    <String, dynamic>{
      'current_institute': instance.currentInstitute,
      'stream': instance.stream,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'current_semester': instance.currentSemester,
      'cgpa': instance.cgpa,
      'scale': instance.scale,
      'backlogs': instance.backlogs,
    };
