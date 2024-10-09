// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submitted_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmittedUrl _$SubmittedUrlFromJson(Map<String, dynamic> json) => SubmittedUrl(
      submittedUrlId: json['submitted_url_id'] as String?,
      fileUrl: json['file_url'] as String?,
      isResubmit: json['is_resubmit'] as bool?,
    );

Map<String, dynamic> _$SubmittedUrlToJson(SubmittedUrl instance) =>
    <String, dynamic>{
      'submitted_url_id': instance.submittedUrlId,
      'file_url': instance.fileUrl,
      'is_resubmit': instance.isResubmit,
    };
