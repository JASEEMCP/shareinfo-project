import 'package:json_annotation/json_annotation.dart';

part 'award_achievement_model.g.dart';

@JsonSerializable()
class AwardAchievementModel {
  int? id;
  String? topic;
  String? organisation;
  @JsonKey(name: 'date_conducted')
  String? dateConducted;
  String? description;

  AwardAchievementModel({
    this.id,
    this.topic,
    this.organisation,
    this.dateConducted,
    this.description,
  });

  factory AwardAchievementModel.fromJson(Map<String, dynamic> json) {
    return _$AwardAchievementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AwardAchievementModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'topic': topic,
      'organisation': organisation,
      'date_conducted': dateConducted,
      'description': description,
    };
  }

  AwardAchievementModel copyWith({
    int? id,
    String? topic,
    String? organisation,
    String? dateConducted,
    String? description,
  }) {
    return AwardAchievementModel(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      organisation: organisation ?? this.organisation,
      dateConducted: dateConducted ?? this.dateConducted,
      description: description,
    );
  }
}
