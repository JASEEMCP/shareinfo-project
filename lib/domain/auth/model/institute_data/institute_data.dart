import 'package:json_annotation/json_annotation.dart';

part 'institute_data.g.dart';

@JsonSerializable()
class InstituteData {
  @JsonKey(name: 'cgpa_scale')
  int? cgpaScale;
  List<String>? departments;

  InstituteData({this.cgpaScale, this.departments});

  factory InstituteData.fromJson(Map<String, dynamic> json) {
    return _$InstituteDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InstituteDataToJson(this);
}
