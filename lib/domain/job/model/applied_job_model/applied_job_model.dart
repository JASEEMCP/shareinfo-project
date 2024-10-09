import 'package:json_annotation/json_annotation.dart';

part 'applied_job_model.g.dart';

@JsonSerializable()
class AppliedJobModel {
  @JsonKey(name: 'job_id')
  String? jobId;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  @JsonKey(name: 'salary_type')
  String? salaryType;
  @JsonKey(name: 'minimum_salary')
  int? minimumSalary;
  @JsonKey(name: 'maximum_salary')
  int? maximumSalary;
  @JsonKey(name: 'working_mode')
  String? workingMode;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'recruiter_mail')
  String? recruiterMail;
  @JsonKey(name: 'institute_name')
  String? instituteName;
  @JsonKey(name: 'is_saved')
  bool? isSaved;
  @JsonKey(name: 'is_campus')
  bool? isCampus;
  List<String>? location;
  @JsonKey(name: 'application_status')
  String? applicationStatus;
  @JsonKey(name: 'application_count')
  int? applicationCount;
  @JsonKey(name: 'company_logo')
  String? companyLogo;

  AppliedJobModel({
    this.jobId,
    this.jobTitle,
    this.salaryType,
    this.minimumSalary,
    this.maximumSalary,
    this.workingMode,
    this.companyName,
    this.isSaved,
    this.isCampus,
    this.location,
    this.applicationStatus,
    this.applicationCount,
    this.instituteName,
    this.recruiterMail,
    this.companyLogo,
  });

  factory AppliedJobModel.fromJson(Map<String, dynamic> json) {
    return _$AppliedJobModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppliedJobModelToJson(this);
}
