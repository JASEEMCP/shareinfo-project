import 'package:json_annotation/json_annotation.dart';

import 'submitted_url.dart';

part 'url.g.dart';

@JsonSerializable()
class Url {
  @JsonKey(name: 'url_id')
  String? urlId;
  @JsonKey(name: 'url_title')
  String? urlTitle;
  @JsonKey(name: 'hint_video_url')
  String? hintVideoUrl;
  @JsonKey(name: 'submitted_url')
  SubmittedUrl? submittedUrl;

  Url({this.urlId, this.urlTitle, this.hintVideoUrl, this.submittedUrl});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
