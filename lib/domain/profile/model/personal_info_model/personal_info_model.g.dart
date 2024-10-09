// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoModel _$PersonalInfoModelFromJson(Map<String, dynamic> json) =>
    PersonalInfoModel(
      phoneNo: json['phone_no'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      postalPin: (json['postal_pin'] as num?)?.toInt(),
      city: json['city'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$PersonalInfoModelToJson(PersonalInfoModel instance) =>
    <String, dynamic>{
      'phone_no': instance.phoneNo,
      'email': instance.email,
      'dob': instance.dob,
      'gender': instance.gender,
      'address': instance.address,
      'postal_pin': instance.postalPin,
      'city': instance.city,
      'district': instance.district,
      'state': instance.state,
    };
