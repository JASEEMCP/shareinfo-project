import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  int? id;
  @JsonKey(name: 'pname')
  String? programName;
  String? role;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  String? description;
  String? media;
  @JsonKey(name: 'project_url')
  String? projectUrl;
  @JsonKey(name: 'reference_url')
  String? referenceUrl;
  @JsonKey(name: 'currently_developing')
  bool? currentlyDeveloping;
  @JsonKey(name: "media_name")
  String? mediaName;

  ProjectModel({
    this.id,
    this.programName,
    this.role,
    this.startDate,
    this.endDate,
    this.description,
    this.media,
    this.projectUrl,
    this.referenceUrl,
    this.currentlyDeveloping,
    this.mediaName,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return _$ProjectModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'pname': programName,
      'role': role,
      'start_date': startDate,
      'end_date': endDate,
      'description': description,
      'media': media,
      'project_url': projectUrl,
      'reference_url': referenceUrl,
      'currently_developing': currentlyDeveloping,
      'media_name': mediaName,
    };
  }

  ProjectModel copyWith({
    int? id,
    String? programName,
    String? role,
    String? startDate,
    String? endDate,
    String? description,
    String? media,
    String? projectUrl,
    String? referenceUrl,
    bool? currentlyDeveloping,
    String? mediaName,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      programName: programName ?? this.programName,
      role: role ?? this.role,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description,
      media: media ?? this.media,
      projectUrl: projectUrl ?? this.projectUrl,
      referenceUrl: referenceUrl ?? this.referenceUrl,
      currentlyDeveloping: currentlyDeveloping ?? this.currentlyDeveloping,
      mediaName: mediaName ?? this.mediaName,
    );
  }
}
