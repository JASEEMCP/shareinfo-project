import 'package:json_annotation/json_annotation.dart';

part 'expected_salary_model.g.dart';

@JsonSerializable()
class ExpectedSalaryModel {
  @JsonKey(name: 'minimum_fulltime')
  int? minimumFulltime;
  @JsonKey(name: 'maximum_fulltime')
  int? maximumFulltime;
  @JsonKey(name: 'minimum_internship')
  int? minimumInternship;
  @JsonKey(name: 'maximum_internship')
  int? maximumInternship;
  String? currency;
  String? frequency;

  ExpectedSalaryModel({
    this.minimumFulltime,
    this.maximumFulltime,
    this.minimumInternship,
    this.maximumInternship,
    this.currency,
    this.frequency,
  });

  factory ExpectedSalaryModel.fromJson(Map<String, dynamic> json) {
    return _$ExpectedSalaryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExpectedSalaryModelToJson(this);

  ExpectedSalaryModel copyWith({
    int? minimumFulltime,
    int? maximumFulltime,
    int? minimumInternship,
    int? maximumInternship,
    String? currency,
    String? frequency,
  }) {
    return ExpectedSalaryModel(
      minimumFulltime: minimumFulltime,
      maximumFulltime: maximumFulltime ?? this.maximumFulltime,
      minimumInternship: minimumInternship,
      maximumInternship: maximumInternship,
      currency: currency ?? this.currency,
      frequency: frequency ?? this.frequency,
    );
  }
}
