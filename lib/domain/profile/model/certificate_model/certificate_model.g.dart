// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) =>
    CertificateModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      issuingOrganization: json['issuing_organization'] as String?,
      issueDate: json['issue_date'] as String?,
      expirationDate: json['expiration_date'] as String?,
      credentialId: json['credential_id'] as String?,
      credentialUrl: json['credential_url'] as String?,
      media: json['media'] as String?,
      expires: json['expires'] as bool?,
      mediaName: json['media_name'] as String?,
    );

Map<String, dynamic> _$CertificateModelToJson(CertificateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issuing_organization': instance.issuingOrganization,
      'issue_date': instance.issueDate,
      'expiration_date': instance.expirationDate,
      'credential_id': instance.credentialId,
      'credential_url': instance.credentialUrl,
      'media_name': instance.mediaName,
      'media': instance.media,
      'expires': instance.expires,
    };
