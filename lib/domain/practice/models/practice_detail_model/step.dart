import 'package:json_annotation/json_annotation.dart';

part 'step.g.dart';

@JsonSerializable()
class ProcessStep {
  String? id;
  @JsonKey(name: 'step_name')
  String? stepName;
  @JsonKey(name: 'step_description')
  List<String>? stepDescription;

  ProcessStep({this.id, this.stepName, this.stepDescription});

  factory ProcessStep.fromJson(Map<String, dynamic> json) =>
      _$ProcessStepFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessStepToJson(this);
}
