import 'package:json_annotation/json_annotation.dart';

part 'summary_model.g.dart';

@JsonSerializable()
class SummaryModel {
  @JsonKey(name: 'summary')
  String? summaryTxt;

  SummaryModel({this.summaryTxt});

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return _$SummaryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}
