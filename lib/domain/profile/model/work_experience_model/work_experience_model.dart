import 'package:json_annotation/json_annotation.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/domain_list_model.dart';

part 'work_experience_model.g.dart';

@JsonSerializable()
class WorkExperienceModel {
  int? id;
  String? title;
  String? company;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  String? description;
  @JsonKey(name: 'employment_type')
  String? employmentType;
  String? location;
  @JsonKey(name: 'job_level')
  String? jobLevel;
  dynamic domain;
  int? domainId;
  @JsonKey(name: 'recent_salary')
  int? recentSalary;
  String? currency;
  String? media;
  @JsonKey(name: 'currently_working')
  bool? currentlyWorking;
  List<DomainListModel>? domainList;
  @JsonKey(name: "media_name")
  String? mediaName;

  WorkExperienceModel({
    this.id,
    this.title,
    this.company,
    this.startDate,
    this.endDate,
    this.description,
    this.employmentType,
    this.location,
    this.jobLevel,
    this.domain,
    this.recentSalary,
    this.currency,
    this.media,
    this.currentlyWorking,
    this.domainList,
    this.domainId,
    this.mediaName,
  });

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) {
    return _$WorkExperienceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkExperienceModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'title': title,
      'company': company,
      'start_date': startDate,
      'end_date': endDate,
      'description': description,
      'employment_type': employmentType,
      'location': location,
      'job_level': jobLevel,
      'domain': domainId,
      'recent_salary': recentSalary,
      'currency': currency,
      'media': media,
      'currently_working': currentlyWorking,
      'media_name': mediaName,
    };
  }

  Map<String, dynamic> manageDataToJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'start_date': startDate,
      'end_date': endDate,
      'description': description,
      'employment_type': employmentType,
      'location': location,
      'job_level': jobLevel,
      'domain': domainId,
      'recent_salary': recentSalary,
      'currency': currency,
      'media': media,
      'currently_working': currentlyWorking,
      'media_name': mediaName,
    };
  }

  WorkExperienceModel copyWith({
    int? id,
    String? title,
    String? company,
    String? startDate,
    String? endDate,
    String? description,
    String? employmentType,
    String? location,
    String? jobLevel,
    dynamic domain,
    int? recentSalary,
    String? currency,
    String? media,
    bool? currentlyWorking,
    List<DomainListModel>? domainList,
    int? domainId,
    String? mediaName,
  }) {
    return WorkExperienceModel(
      domainId: domainId ?? this.domainId,
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description,
      employmentType: employmentType ?? this.employmentType,
      location: location ?? this.location,
      jobLevel: jobLevel ?? this.jobLevel,
      domain: domain ?? this.domain,
      recentSalary: recentSalary ?? this.recentSalary,
      currency: currency ?? this.currency,
      media: media ?? this.media,
      currentlyWorking: currentlyWorking ?? this.currentlyWorking,
      domainList: domainList ?? this.domainList,
      mediaName: mediaName ?? this.mediaName,
    );
  }
}
