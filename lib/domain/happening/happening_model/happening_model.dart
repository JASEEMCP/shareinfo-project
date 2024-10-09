import 'package:json_annotation/json_annotation.dart';

part 'happening_model.g.dart';

@JsonSerializable()
class HappeningModel {
  @JsonKey(name: 'event_id')
  String? eventId;
  String? title;
  @JsonKey(name: 'organizer_name')
  String? organizerName;
  @JsonKey(name: 'organizer_role')
  String? organizerRole;
  @JsonKey(name: 'organizer_company')
  String? organizerCompany;
  @JsonKey(name: 'organizer_image')
  String? organizerImage;
  List<String>? skills;
  String? description;
  List<String>? outcome;
  List<String>? highlights;
  List<String>? audience;
  String? date;
  String? time;
  @JsonKey(name: 'banner_image')
  String? bannerImage;
  String? url;
  @JsonKey(name: 'is_joinable')
  bool? isJoinable;
  @JsonKey(name: 'is_registered')
  bool? isRegistered;
  @JsonKey(name: 'is_rated')
  bool? isRated;
  @JsonKey(name: 'is_saved')
  bool? isSaved;
  @JsonKey(name: 'is_session_ended')
  bool? isSessionEnded;
  @JsonKey(name: 'video_url')
  String? videoUrl;
  @JsonKey(name: 'registration_count')
  int? registrationCount;
  @JsonKey(name: 'is_expired')
  bool? isExpired;

  HappeningModel({
    this.eventId,
    this.title,
    this.organizerName,
    this.organizerRole,
    this.organizerCompany,
    this.organizerImage,
    this.skills,
    this.description,
    this.outcome,
    this.highlights,
    this.audience,
    this.date,
    this.time,
    this.bannerImage,
    this.url,
    this.isJoinable,
    this.isRegistered,
    this.isRated,
    this.isSaved,
    this.isSessionEnded,
    this.registrationCount,
    this.videoUrl,
    this.isExpired,
  });

  factory HappeningModel.fromJson(Map<String, dynamic> json) {
    return _$HappeningModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HappeningModelToJson(this);
}
