import 'package:json_annotation/json_annotation.dart';

part 'skill_set.g.dart';

@JsonSerializable()
class SkillSet {
  int? id;
  String? skill;
  @JsonKey(name: 'skill_name')
  String? skillName;

  SkillSet({this.id, this.skill, this.skillName});

  factory SkillSet.fromJson(Map<String, dynamic> json) {
    return _$SkillSetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SkillSetToJson(this);
}
