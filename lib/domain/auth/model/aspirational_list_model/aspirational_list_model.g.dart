// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aspirational_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AspirationalListModel _$AspirationalListModelFromJson(
        Map<String, dynamic> json) =>
    AspirationalListModel(
      id: (json['id'] as num?)?.toInt(),
      aspirationalField: json['aspirational_field'] as String?,
    );

Map<String, dynamic> _$AspirationalListModelToJson(
        AspirationalListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aspirational_field': instance.aspirationalField,
    };
