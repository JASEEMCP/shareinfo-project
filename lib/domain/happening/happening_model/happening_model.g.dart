// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'happening_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HappeningModel _$HappeningModelFromJson(Map<String, dynamic> json) =>
    HappeningModel(
      eventId: json['event_id'] as String?,
      title: json['title'] as String?,
      organizerName: json['organizer_name'] as String?,
      organizerRole: json['organizer_role'] as String?,
      organizerCompany: json['organizer_company'] as String?,
      organizerImage: json['organizer_image'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      outcome:
          (json['outcome'] as List<dynamic>?)?.map((e) => e as String).toList(),
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      audience: (json['audience'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      bannerImage: json['banner_image'] as String?,
      url: json['url'] as String?,
      isJoinable: json['is_joinable'] as bool?,
      isRegistered: json['is_registered'] as bool?,
      isRated: json['is_rated'] as bool?,
      isSaved: json['is_saved'] as bool?,
      isSessionEnded: json['is_session_ended'] as bool?,
      registrationCount: (json['registration_count'] as num?)?.toInt(),
      videoUrl: json['video_url'] as String?,
      isExpired: json['is_expired'] as bool?,
    );

Map<String, dynamic> _$HappeningModelToJson(HappeningModel instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'title': instance.title,
      'organizer_name': instance.organizerName,
      'organizer_role': instance.organizerRole,
      'organizer_company': instance.organizerCompany,
      'organizer_image': instance.organizerImage,
      'skills': instance.skills,
      'description': instance.description,
      'outcome': instance.outcome,
      'highlights': instance.highlights,
      'audience': instance.audience,
      'date': instance.date,
      'time': instance.time,
      'banner_image': instance.bannerImage,
      'url': instance.url,
      'is_joinable': instance.isJoinable,
      'is_registered': instance.isRegistered,
      'is_rated': instance.isRated,
      'is_saved': instance.isSaved,
      'is_session_ended': instance.isSessionEnded,
      'video_url': instance.videoUrl,
      'registration_count': instance.registrationCount,
      'is_expired': instance.isExpired,
    };
