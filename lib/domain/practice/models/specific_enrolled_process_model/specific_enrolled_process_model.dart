import 'package:json_annotation/json_annotation.dart';

import 'url.dart';

part 'specific_enrolled_process_model.g.dart';

@JsonSerializable()
class SpecificEnrolledProcessModel {
  @JsonKey(name: 'process_id')
  String? processId;
  int? practice;
  @JsonKey(name: 'process_name')
  String? processName;
  @JsonKey(name: 'task_description')
  List<String>? taskDescription;
  List<Url>? urls;
  String? status;
  bool isExpanded;

  SpecificEnrolledProcessModel({
    this.processId,
    this.practice,
    this.processName,
    this.taskDescription,
    this.urls,
    this.status,
    this.isExpanded = false,
  });

  factory SpecificEnrolledProcessModel.fromJson(Map<String, dynamic> json) {
    return _$SpecificEnrolledProcessModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpecificEnrolledProcessModelToJson(this);
}
