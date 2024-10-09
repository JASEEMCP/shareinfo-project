// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostOffice _$PostOfficeFromJson(Map<String, dynamic> json) => PostOffice(
      district: json['District'] as String?,
      division: json['Division'] as String?,
      block: json['block'] as String?,
      state: json['State'] as String?,
      pincode: json['Pincode'] as String?,
    );

Map<String, dynamic> _$PostOfficeToJson(PostOffice instance) =>
    <String, dynamic>{
      'District': instance.district,
      'Division': instance.division,
      'block': instance.block,
      'State': instance.state,
      'Pincode': instance.pincode,
    };
