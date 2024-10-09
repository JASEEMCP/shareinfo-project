import 'package:json_annotation/json_annotation.dart';

part 'seminar_training_model.g.dart';

@JsonSerializable()
class SeminarTrainingModel {
  int? id;
  String? title;
  String? organisation;
  String? date;
  String? description;

  SeminarTrainingModel({
    this.id,
    this.title,
    this.organisation,
    this.date,
    this.description,
  });

  factory SeminarTrainingModel.fromJson(Map<String, dynamic> json) {
    return _$SeminarTrainingModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeminarTrainingModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'title': title,
      'organisation': organisation,
      'date': date,
      'description': description,
    };
  }

  SeminarTrainingModel copyWith({
    int? id,
    String? title,
    String? organisation,
    String? date,
    String? description,
  }) {
    return SeminarTrainingModel(
      id: id ?? this.id,
      title: title ?? this.title,
      organisation: organisation ?? this.organisation,
      date: date ?? this.date,
      description: description,
    );
  }
}
