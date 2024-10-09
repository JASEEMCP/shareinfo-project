import 'package:json_annotation/json_annotation.dart';

part 'uncompleted_fields.g.dart';

@JsonSerializable()
class UncompletedFields {
  @JsonKey(name: 'is_personal_information_filled')
  bool? isPersonalInformationFilled;
  @JsonKey(name: 'is_current_institute_filled')
  bool? isCurrentInstituteFilled;
  @JsonKey(name: 'is_education_filled')
  bool? isEducationFilled;
  @JsonKey(name: 'is_skill_filled')
  bool? isSkillFilled;
  @JsonKey(name: 'is_language_filled')
  bool? isLanguageFilled;
  @JsonKey(name: 'is_cv_resume_filled')
  bool? isCvResumeFilled;

  UncompletedFields({
    this.isPersonalInformationFilled,
    this.isCurrentInstituteFilled,
    this.isEducationFilled,
    this.isSkillFilled,
    this.isLanguageFilled,
    this.isCvResumeFilled,
  });

  factory UncompletedFields.fromJson(Map<String, dynamic> json) {
    return _$UncompletedFieldsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UncompletedFieldsToJson(this);
}
