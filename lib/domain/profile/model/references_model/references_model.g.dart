// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'references_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferencesModel _$ReferencesModelFromJson(Map<String, dynamic> json) =>
    ReferencesModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      role: json['role'] as String?,
      organization: json['organization'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ReferencesModelToJson(ReferencesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'organization': instance.organization,
      'email': instance.email,
      'phone_no': instance.phoneNo,
      'description': instance.description,
    };
