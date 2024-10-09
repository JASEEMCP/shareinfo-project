// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Url _$UrlFromJson(Map<String, dynamic> json) => Url(
      urlId: json['url_id'] as String?,
      urlTitle: json['url_title'] as String?,
      hintVideoUrl: json['hint_video_url'] as String?,
      submittedUrl: json['submitted_url'] == null
          ? null
          : SubmittedUrl.fromJson(
              json['submitted_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
      'url_id': instance.urlId,
      'url_title': instance.urlTitle,
      'hint_video_url': instance.hintVideoUrl,
      'submitted_url': instance.submittedUrl,
    };
