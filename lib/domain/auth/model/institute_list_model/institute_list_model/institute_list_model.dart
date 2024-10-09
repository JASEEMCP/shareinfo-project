import 'package:json_annotation/json_annotation.dart';

part 'institute_list_model.g.dart';

@JsonSerializable()
class InstituteListModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'institute_name')
  String? fullName;

  InstituteListModel({this.id, this.fullName});

  factory InstituteListModel.fromJson(Map<String, dynamic> json) {
    return _$InstituteListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InstituteListModelToJson(this);
}
