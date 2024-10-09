// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeJobModel _$HomeJobModelFromJson(Map<String, dynamic> json) => HomeJobModel(
      jobList: (json['jobList'] as List<dynamic>?)
          ?.map((e) => JobCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      domain:
          (json['domain'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HomeJobModelToJson(HomeJobModel instance) =>
    <String, dynamic>{
      'jobList': instance.jobList,
      'domain': instance.domain,
    };
