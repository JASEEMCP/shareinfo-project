import 'package:json_annotation/json_annotation.dart';

part 'language_set.g.dart';

@JsonSerializable()
class LanguageSet {
  int? id;
  String? language;
  String? proficiency;

  LanguageSet({this.id, this.language, this.proficiency});

  factory LanguageSet.fromJson(Map<String, dynamic> json) {
    return _$LanguageSetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LanguageSetToJson(this);
}
