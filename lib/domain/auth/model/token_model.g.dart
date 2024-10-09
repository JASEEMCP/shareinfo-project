// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      isProfileCreated: json['is_profile_created'] as bool?,
      fullName: json['full_name'] as String?,
      isStudent: json['is_student'] as bool?,
      profilePhoto: json['profile_photo'] as String?,
      fcmToken: json['fcmToken'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'is_profile_created': instance.isProfileCreated,
      'full_name': instance.fullName,
      'is_student': instance.isStudent,
      'profile_photo': instance.profilePhoto,
      'fcmToken': instance.fcmToken,
      'email': instance.email,
    };
