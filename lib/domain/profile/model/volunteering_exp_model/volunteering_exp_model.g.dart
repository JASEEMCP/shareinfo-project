// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteering_exp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolunteeringExpModel _$VolunteeringExpModelFromJson(
        Map<String, dynamic> json) =>
    VolunteeringExpModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      organization: json['organization'] as String?,
      role: json['role'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      description: json['description'] as String?,
      organizationWebsite: json['organization_website'] as String?,
      isOngoing: json['is_ongoing'] as bool?,
    );

Map<String, dynamic> _$VolunteeringExpModelToJson(
        VolunteeringExpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'organization': instance.organization,
      'role': instance.role,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'description': instance.description,
      'organization_website': instance.organizationWebsite,
      'is_ongoing': instance.isOngoing,
    };
