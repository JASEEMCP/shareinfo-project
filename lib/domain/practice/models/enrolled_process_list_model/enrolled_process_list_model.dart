import 'package:json_annotation/json_annotation.dart';
import 'package:shareinfo/domain/practice/models/specific_enrolled_process_model/specific_enrolled_process_model.dart';

part 'enrolled_process_list_model.g.dart';

@JsonSerializable()
class EnrolledProcessListModel {
  @JsonKey(name: 'process_id')
  String? id;
  @JsonKey(name: 'process_name')
  String? processName;
  @JsonKey(name: 'task_description')
  List<String>? taskDescription;
  String? status;
  SpecificEnrolledProcessModel? specificProcessDetail;

  EnrolledProcessListModel({
    this.id,
    this.processName,
    this.taskDescription,
    this.status,
    this.specificProcessDetail,
  });

  factory EnrolledProcessListModel.fromJson(Map<String, dynamic> json) {
    return _$EnrolledProcessListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EnrolledProcessListModelToJson(this);
}
