// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollDetailModel _$EnrollDetailModelFromJson(Map<String, dynamic> json) =>
    EnrollDetailModel(
      enrolledDetail: json['enrolledDetail'] == null
          ? null
          : EnrolledDetailedViewModel.fromJson(
              json['enrolledDetail'] as Map<String, dynamic>),
      processList: (json['processList'] as List<dynamic>?)
          ?.map((e) =>
              EnrolledProcessListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnrollDetailModelToJson(EnrollDetailModel instance) =>
    <String, dynamic>{
      'enrolledDetail': instance.enrolledDetail,
      'processList': instance.processList,
    };
