// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInformation _$PersonalInformationFromJson(Map<String, dynamic> json) =>
    PersonalInformation(
      address: json['address'] as String?,
      dob: json['dob'] as String?,
      phoneNo: json['phone_no'] as String?,
      email: json['email'] as String?,
    )..gender = json['gender'] as String?;

Map<String, dynamic> _$PersonalInformationToJson(
        PersonalInformation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'dob': instance.dob,
      'gender': instance.gender,
      'phone_no': instance.phoneNo,
      'email': instance.email,
    };
