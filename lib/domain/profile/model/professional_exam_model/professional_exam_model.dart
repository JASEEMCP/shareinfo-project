import 'package:json_annotation/json_annotation.dart';

part 'professional_exam_model.g.dart';

@JsonSerializable()
class ProfessionalExamModel {
  int? id;
  String? title;
  double? score;
  int? scale;
  @JsonKey(name: 'date_of_issue')
  String? dateOfIssue;
  String? description;

  ProfessionalExamModel({
    this.id,
    this.title,
    this.score,
    this.scale,
    this.dateOfIssue,
    this.description,
  });

  factory ProfessionalExamModel.fromJson(Map<String, dynamic> json) {
    return _$ProfessionalExamModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfessionalExamModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'title': title,
      'score': score,
      'scale': scale,
      'date_of_issue': dateOfIssue,
      'description': description,
    };
  }

  ProfessionalExamModel copyWith({
    int? id,
    String? title,
    double? score,
    int? scale,
    String? dateOfIssue,
    String? description,
  }) {
    return ProfessionalExamModel(
      id: id ?? this.id,
      title: title ?? this.title,
      score: score ?? this.score,
      scale: scale ?? this.scale,
      dateOfIssue: dateOfIssue ?? this.dateOfIssue,
      description: description,
    );
  }
}
