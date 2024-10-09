// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AffiliationsModel _$AffiliationsModelFromJson(Map<String, dynamic> json) =>
    AffiliationsModel(
      id: (json['id'] as num?)?.toInt(),
      organization: json['organization'] as String?,
      role: json['role'] as String?,
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
      description: json['description'] as String?,
      isOngoing: json['is_ongoing'] as bool?,
    );

Map<String, dynamic> _$AffiliationsModelToJson(AffiliationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization': instance.organization,
      'role': instance.role,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'description': instance.description,
      'is_ongoing': instance.isOngoing,
    };
