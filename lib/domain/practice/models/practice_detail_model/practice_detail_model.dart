import 'package:json_annotation/json_annotation.dart';

import 'step.dart';

part 'practice_detail_model.g.dart';

@JsonSerializable()
class PracticeDetailModel {
  String? id;
  @JsonKey(name: 'banner_image')
  String? bannerImage;
  @JsonKey(name: 'practice_task')
  String? practiceTask;
  String? description;
  String? category;
  @JsonKey(name: 'sub_categories')
  List<String>? subCategories;
  String? objective;
  String? overview;
  List<ProcessStep>? steps;
  @JsonKey(name: 'is_enroll')
  bool? isEnroll;

  PracticeDetailModel({
    this.id,
    this.bannerImage,
    this.practiceTask,
    this.description,
    this.category,
    this.subCategories,
    this.objective,
    this.overview,
    this.steps,
    this.isEnroll,
  });

  factory PracticeDetailModel.fromJson(Map<String, dynamic> json) {
    return _$PracticeDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PracticeDetailModelToJson(this);
}
