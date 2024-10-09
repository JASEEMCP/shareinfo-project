// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInformationModel _$PersonalInformationModelFromJson(
        Map<String, dynamic> json) =>
    PersonalInformationModel(
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNo: json['phone_no'] as String?,
      email: json['email'] as String?,
      currentPosition: json['current_position'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$PersonalInformationModelToJson(
        PersonalInformationModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'phone_no': instance.phoneNo,
      'email': instance.email,
      'current_position': instance.currentPosition,
      'dob': instance.dob,
      'gender': instance.gender,
      'state': instance.state,
    };
