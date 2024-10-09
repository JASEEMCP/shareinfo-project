import 'package:json_annotation/json_annotation.dart';

part 'cv_resume_set.g.dart';

@JsonSerializable()
class CvResumeSet {
  int? id;
  String? cv;
  @JsonKey(name: "media_name")
  String? mediaName;

  CvResumeSet({this.id, this.cv, this.mediaName});

  factory CvResumeSet.fromJson(Map<String, dynamic> json) {
    return _$CvResumeSetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CvResumeSetToJson(this);
}
