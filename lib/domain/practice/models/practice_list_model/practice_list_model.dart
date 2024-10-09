import 'package:json_annotation/json_annotation.dart';

part 'practice_list_model.g.dart';

@JsonSerializable()
class PracticeListModel {
  @JsonKey(name: 'practice_id')
  String? id;
  @JsonKey(name: 'practice_task')
  String? practiceTask;
  int? perks;
  String? description;
  @JsonKey(name: 'is_enroll')
  bool? isEnroll;
  String? category;

  PracticeListModel({
    this.id,
    this.practiceTask,
    this.perks,
    this.description,
    this.isEnroll,
    this.category,
  });

  factory PracticeListModel.fromJson(Map<String, dynamic> json) {
    return _$PracticeListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PracticeListModelToJson(this);
}
