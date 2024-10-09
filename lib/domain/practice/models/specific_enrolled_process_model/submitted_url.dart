import 'package:json_annotation/json_annotation.dart';

part 'submitted_url.g.dart';

@JsonSerializable()
class SubmittedUrl {
  @JsonKey(name: 'submitted_url_id')
  String? submittedUrlId;
  @JsonKey(name: 'file_url')
  String? fileUrl;
  @JsonKey(name: 'is_resubmit')
  bool? isResubmit;

  SubmittedUrl({this.submittedUrlId, this.fileUrl, this.isResubmit});

  factory SubmittedUrl.fromJson(Map<String, dynamic> json) {
    return _$SubmittedUrlFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubmittedUrlToJson(this);
}
