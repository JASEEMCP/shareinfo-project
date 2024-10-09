import 'package:json_annotation/json_annotation.dart';

part 'aspirational_list_model.g.dart';

@JsonSerializable()
class AspirationalListModel {
  int? id;
  @JsonKey(name: 'aspirational_field')
  String? aspirationalField;

  AspirationalListModel({this.id, this.aspirationalField});

  factory AspirationalListModel.fromJson(Map<String, dynamic> json) {
    return _$AspirationalListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AspirationalListModelToJson(this);
}
