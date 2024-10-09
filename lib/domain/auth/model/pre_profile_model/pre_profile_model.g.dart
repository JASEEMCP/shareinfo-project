// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreProfileModel _$PreProfileModelFromJson(Map<String, dynamic> json) =>
    PreProfileModel(
      currentInstitute: (json['current_institute'] as num?)?.toInt(),
      currentStatus: json['current_status'] as String?,
      expertise: json['expertise'] as String?,
      aspirationalFields: (json['aspirational_fields'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      backlogs: (json['backlogs'] as num?)?.toInt(),
      cgpa: (json['cgpa'] as num?)?.toDouble(),
      endDate: (json['end_date'] as num?)?.toInt(),
      idBack: json['id_card_back'] as String?,
      idFront: json['id_card_front'] as String?,
      scale: (json['scale'] as num?)?.toInt(),
      startDate: (json['start_date'] as num?)?.toInt(),
      stream: json['stream'] as String?,
      currentSemester: json['current_semester'] as String?,
      registerId: json['register_id'] as String?,
    );

Map<String, dynamic> _$PreProfileModelToJson(PreProfileModel instance) =>
    <String, dynamic>{
      'current_institute': instance.currentInstitute,
      'current_status': instance.currentStatus,
      'expertise': instance.expertise,
      'aspirational_fields': instance.aspirationalFields,
      'stream': instance.stream,
      'register_id': instance.registerId,
      'current_semester': instance.currentSemester,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'cgpa': instance.cgpa,
      'scale': instance.scale,
      'id_card_front': instance.idFront,
      'id_card_back': instance.idBack,
      'backlogs': instance.backlogs,
    };
