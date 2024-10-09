// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationActivityModel _$OrganizationActivityModelFromJson(
        Map<String, dynamic> json) =>
    OrganizationActivityModel(
      id: (json['id'] as num?)?.toInt(),
      organization: json['organization'] as String?,
      role: json['role'] as String?,
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
      description: json['description'] as String?,
      idCard: json['id_card'] as String?,
      isOngoing: json['is_ongoing'] as bool?,
      mediaName: json['media_name'] as String?,
    );

Map<String, dynamic> _$OrganizationActivityModelToJson(
        OrganizationActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization': instance.organization,
      'role': instance.role,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'description': instance.description,
      'id_card': instance.idCard,
      'is_ongoing': instance.isOngoing,
      'media_name': instance.mediaName,
    };
