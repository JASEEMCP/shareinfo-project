import 'package:json_annotation/json_annotation.dart';

part 'education_model.g.dart';

@JsonSerializable()
class EducationModel {
  int? id;
  String? institute;
  @JsonKey(name: 'educational_attainment')
  String? educationalAttainment;
  String? course;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  double? gpa;
  int? scale;
  String? description;
  String? media;
  @JsonKey(name: 'currently_studying')
  bool? currentlyStudying;
  @JsonKey(name: "media_name")
  String? mediaName;

  EducationModel({
    this.id,
    this.institute,
    this.educationalAttainment,
    this.course,
    this.startDate,
    this.endDate,
    this.gpa,
    this.scale,
    this.description,
    this.media,
    this.currentlyStudying,
    this.mediaName,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return _$EducationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EducationModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'institute': institute,
      'educational_attainment': educationalAttainment,
      'course': course,
      'start_date': startDate,
      'end_date': endDate,
      'gpa': gpa,
      'scale': scale,
      'description': description,
      'media': media,
      'currently_studying': currentlyStudying,
    };
  }

  EducationModel copyWith({
    int? id,
    String? institute,
    String? educationalAttainment,
    String? course,
    String? startDate,
    String? endDate,
    double? gpa,
    int? scale,
    String? description,
    String? media,
    bool? currentlyStudying,
  }) {
    return EducationModel(
      id: id ?? this.id,
      institute: institute ?? this.institute,
      educationalAttainment:
          educationalAttainment ?? this.educationalAttainment,
      course: course ?? this.course,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      gpa: gpa ?? this.gpa,
      scale: scale ?? this.scale,
      description: description,
      media: media ?? this.media,
      currentlyStudying: currentlyStudying ?? this.currentlyStudying,
    );
  }
}
