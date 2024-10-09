// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateProfileModel _$CandidateProfileModelFromJson(
        Map<String, dynamic> json) =>
    CandidateProfileModel(
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePhoto: json['profile_photo'] as String?,
      currentPosition: json['current_position'] as String?,
      currentOrganization: json['current_organization'] as String?,
    );

Map<String, dynamic> _$CandidateProfileModelToJson(
        CandidateProfileModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'profile_photo': instance.profilePhoto,
      'current_position': instance.currentPosition,
      'current_organization': instance.currentOrganization,
    };
