// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainListModel _$DomainListModelFromJson(Map<String, dynamic> json) =>
    DomainListModel(
      id: (json['id'] as num?)?.toInt(),
      domainName: json['domain_name'] as String?,
    );

Map<String, dynamic> _$DomainListModelToJson(DomainListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'domain_name': instance.domainName,
    };
