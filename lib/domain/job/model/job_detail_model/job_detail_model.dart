import 'package:json_annotation/json_annotation.dart';

part 'job_detail_model.g.dart';

@JsonSerializable()
class JobDetailModel {
  @JsonKey(name: 'educational_qualification')
  String? educationalQualification;
  @JsonKey(name: 'min_qualification')
  List<String>? minQualification;
  @JsonKey(name: 'experience_type')
  String? experienceType;
  @JsonKey(name: 'job_id')
  String? jobId;
  @JsonKey(name: 'company_logo')
  String? companyLogo;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'institute_name')
  String? instituteName;
  List<String>? location;
  @JsonKey(name: 'salary_type')
  String? salaryType;
  @JsonKey(name: 'minimum_salary')
  int? minimumSalary;
  @JsonKey(name: 'maximum_salary')
  int? maximumSalary;
  @JsonKey(name: 'working_mode')
  String? workingMode;
  @JsonKey(name: 'recruitment_start_date')
  String? recruitmentStartDate;
  @JsonKey(name: 'recruitment_end_date')
  String? recruitmentEndDate;
  @JsonKey(name: 'job_description')
  List<String>? jobDescription;
  @JsonKey(name: 'required_qualities')
  List<String>? requiredQualities;
  @JsonKey(name: 'perks_benefits')
  List<String>? perksBenefits;
  @JsonKey(name: 'required_skills')
  List<String>? requiredSkills;
  @JsonKey(name: 'min_cgpa')
  double? minCgpa;
  @JsonKey(name: 'back_papers')
  int? backPapers;
  @JsonKey(name: 'job_level')
  String? jobLevel;
  @JsonKey(name: 'job_category')
  String? jobCategory;
  @JsonKey(name: 'no_of_vacancies')
  int? noOfVacancies;
  String? domain;
  @JsonKey(name: 'support_mail')
  String? supportMail;
  @JsonKey(name: 'company_website')
  String? companyWebsite;
  @JsonKey(name: 'reference_website')
  String? referenceWebsite;
  @JsonKey(name: 'is_campus')
  bool? isCampus;
  @JsonKey(name: 'is_applied')
  bool? isApplied;
  @JsonKey(name: 'is_saved')
  bool? isSaved;

  JobDetailModel({
    this.jobId,
    this.companyLogo,
    this.jobTitle,
    this.companyName,
    this.instituteName,
    this.location,
    this.salaryType,
    this.minimumSalary,
    this.maximumSalary,
    this.workingMode,
    this.recruitmentStartDate,
    this.recruitmentEndDate,
    this.jobDescription,
    this.requiredQualities,
    this.perksBenefits,
    this.requiredSkills,
    this.minCgpa,
    this.backPapers,
    this.jobLevel,
    this.jobCategory,
    this.noOfVacancies,
    this.domain,
    this.supportMail,
    this.companyWebsite,
    this.educationalQualification,
    this.experienceType,
    this.isApplied,
    this.isCampus,
    this.referenceWebsite,
    this.isSaved,
    this.minQualification,
  });

  factory JobDetailModel.fromJson(Map<String, dynamic> json) {
    return _$JobDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobDetailModelToJson(this);

  JobDetailModel copyWith({
    String? jobId,
    String? companyLogo,
    String? jobTitle,
    String? companyName,
    String? instituteName,
    List<String>? location,
    String? salaryType,
    int? minimumSalary,
    int? maximumSalary,
    String? workingMode,
    String? recruitmentStartDate,
    String? recruitmentEndDate,
    List<String>? jobDescription,
    List<String>? requiredQualities,
    List<String>? perksBenefits,
    List<String>? requiredSkills,
    double? minCgpa,
    int? backPapers,
    String? jobLevel,
    String? jobCategory,
    int? noOfVacancies,
    String? domain,
    String? supportMail,
    String? companyWebsite,
    String? experienceType,
    String? educationalQualification,
    String? referenceWebsite,
    String? isCampus,
    String? isApplied,
  }) {
    return JobDetailModel(
      jobId: jobId ?? this.jobId,
      companyLogo: companyLogo ?? this.companyLogo,
      jobTitle: jobTitle ?? this.jobTitle,
      companyName: companyName ?? this.companyName,
      instituteName: instituteName ?? this.instituteName,
      location: location ?? this.location,
      salaryType: salaryType ?? this.salaryType,
      minimumSalary: minimumSalary ?? this.minimumSalary,
      maximumSalary: maximumSalary ?? this.maximumSalary,
      workingMode: workingMode ?? this.workingMode,
      recruitmentStartDate: recruitmentStartDate ?? this.recruitmentStartDate,
      recruitmentEndDate: recruitmentEndDate ?? this.recruitmentEndDate,
      jobDescription: jobDescription ?? this.jobDescription,
      requiredQualities: requiredQualities ?? this.requiredQualities,
      perksBenefits: perksBenefits ?? this.perksBenefits,
      requiredSkills: requiredSkills ?? this.requiredSkills,
      minCgpa: minCgpa ?? this.minCgpa,
      backPapers: backPapers ?? this.backPapers,
      jobLevel: jobLevel ?? this.jobLevel,
      jobCategory: jobCategory ?? this.jobCategory,
      noOfVacancies: noOfVacancies ?? this.noOfVacancies,
      domain: domain ?? this.domain,
      supportMail: supportMail ?? this.supportMail,
      companyWebsite: companyWebsite ?? this.companyWebsite,
      educationalQualification:
          educationalQualification ?? this.educationalQualification,
      experienceType: experienceType ?? this.experienceType,
    );
  }
}
