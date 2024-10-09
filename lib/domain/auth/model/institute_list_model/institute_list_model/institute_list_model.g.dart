// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstituteListModel _$InstituteListModelFromJson(Map<String, dynamic> json) =>
    InstituteListModel(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['institute_name'] as String?,
    );

Map<String, dynamic> _$InstituteListModelToJson(InstituteListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'institute_name': instance.fullName,
    };
