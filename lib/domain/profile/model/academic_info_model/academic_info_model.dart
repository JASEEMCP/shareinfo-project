import 'package:json_annotation/json_annotation.dart';

part 'academic_info_model.g.dart';

@JsonSerializable()
class AcademicInfoModel {
  @JsonKey(name: 'current_institute')
  String? currentInstitute;
  String? stream;
  @JsonKey(name: 'start_date')
  int? startDate;
  @JsonKey(name: 'end_date')
  int? endDate;
  @JsonKey(name: 'current_semester')
  String? currentSemester;
  double? cgpa;
  int? scale;
  int? backlogs;

  AcademicInfoModel({
    this.currentInstitute,
    this.stream,
    this.startDate,
    this.endDate,
    this.currentSemester,
    this.cgpa,
    this.scale,
    this.backlogs,
  });

  factory AcademicInfoModel.fromJson(Map<String, dynamic> json) {
    return _$AcademicInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcademicInfoModelToJson(this);
  Map<String, dynamic> updateDataToJson() {
    return {
      'current_semester': currentSemester,
      'cgpa': cgpa,
      'backlogs': backlogs,
    };
  }

  AcademicInfoModel copyWith({
    String? currentInstitute,
    String? stream,
    int? startDate,
    int? endDate,
    String? currentSemester,
    double? cgpa,
    int? scale,
    int? backlogs,
  }) {
    return AcademicInfoModel(
      currentInstitute: currentInstitute ?? this.currentInstitute,
      stream: stream ?? this.stream,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      currentSemester: currentSemester ?? this.currentSemester,
      cgpa: cgpa,
      scale: scale ?? this.scale,
      backlogs: backlogs,
    );
  }
}
