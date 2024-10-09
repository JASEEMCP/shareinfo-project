import 'package:json_annotation/json_annotation.dart';

part 'job_card_model.g.dart';

@JsonSerializable()
class JobCardModel {
  @JsonKey(name: 'job_id')
  String? jobId;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  @JsonKey(name: 'company_name')
  String? companyName;
  List<String>? location;
  @JsonKey(name: 'salary_type')
  String? salaryType;
  @JsonKey(name: 'minimum_salary')
  int? minimumSalary;
  @JsonKey(name: 'maximum_salary')
  int? maximumSalary;
  @JsonKey(name: 'working_mode')
  String? workingMode;
  @JsonKey(name: 'is_saved')
  bool? isSaved;
  @JsonKey(name: 'is_campus')
  bool? isCampus;
  @JsonKey(name: 'company_logo')
  String? companyLogo;

  JobCardModel({
    this.jobId,
    this.jobTitle,
    this.companyName,
    this.location,
    this.salaryType,
    this.minimumSalary,
    this.maximumSalary,
    this.workingMode,
    this.isSaved,
    this.isCampus,
    this.companyLogo,
  });

  factory JobCardModel.fromJson(Map<String, dynamic> json) {
    return _$JobCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobCardModelToJson(this);

  JobCardModel copyWith({
    String? jobId,
    String? jobTitle,
    String? companyName,
    List<String>? location,
    String? salaryType,
    int? minimumSalary,
    int? maximumSalary,
    String? workingMode,
    bool? isSaved,
    bool? isCampus,
  }) {
    return JobCardModel(
      jobId: jobId ?? this.jobId,
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      location: location ?? this.location,
      salaryType: salaryType ?? this.salaryType,
      minimumSalary: minimumSalary ?? this.minimumSalary,
      maximumSalary: maximumSalary ?? this.maximumSalary,
      workingMode: workingMode ?? this.workingMode,
      isSaved: isSaved ?? this.isSaved,
      isCampus: isCampus ?? this.isCampus,
    );
  }
}
