import 'package:json_annotation/json_annotation.dart';

part 'affiliations_model.g.dart';

@JsonSerializable()
class AffiliationsModel {
  int? id;
  String? organization;
  String? role;
  @JsonKey(name: 'from_date')
  String? fromDate;
  @JsonKey(name: 'to_date')
  String? toDate;
  String? description;
  @JsonKey(name: 'is_ongoing')
  bool? isOngoing;

  AffiliationsModel({
    this.id,
    this.organization,
    this.role,
    this.fromDate,
    this.toDate,
    this.description,
    this.isOngoing,
  });

  factory AffiliationsModel.fromJson(Map<String, dynamic> json) {
    return _$AffiliationsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AffiliationsModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'organization': organization,
      'role': role,
      'from_date': fromDate,
      'to_date': toDate,
      'description': description,
      'is_ongoing': isOngoing,
    };
  }

  AffiliationsModel copyWith({
    int? id,
    String? organization,
    String? role,
    String? fromDate,
    String? toDate,
    String? description,
    bool? isOngoing,
  }) {
    return AffiliationsModel(
      id: id ?? this.id,
      organization: organization ?? this.organization,
      role: role,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      description: description,
      isOngoing: isOngoing ?? this.isOngoing,
    );
  }
}
