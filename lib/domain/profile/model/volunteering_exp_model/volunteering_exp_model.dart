import 'package:json_annotation/json_annotation.dart';

part 'volunteering_exp_model.g.dart';

@JsonSerializable()
class VolunteeringExpModel {
  int? id;
  String? title;
  String? organization;
  String? role;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  String? description;
  @JsonKey(name: 'organization_website')
  String? organizationWebsite;
  @JsonKey(name: 'is_ongoing')
  bool? isOngoing;

  VolunteeringExpModel({
    this.id,
    this.title,
    this.organization,
    this.role,
    this.startDate,
    this.endDate,
    this.description,
    this.organizationWebsite,
    this.isOngoing,
  });

  factory VolunteeringExpModel.fromJson(Map<String, dynamic> json) {
    return _$VolunteeringExpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VolunteeringExpModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'title': title,
      'organization': organization,
      'role': role,
      'start_date': startDate,
      'end_date': endDate,
      'description': description,
      'organization_website': organizationWebsite,
      'is_ongoing': isOngoing,
    };
  }

  VolunteeringExpModel copyWith({
    int? id,
    String? title,
    String? organization,
    String? role,
    String? startDate,
    String? endDate,
    String? description,
    String? organizationWebsite,
    bool? isOngoing,
  }) {
    return VolunteeringExpModel(
      id: id ?? this.id,
      title: title ?? this.title,
      organization: organization ?? this.organization,
      role: role,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description,
      organizationWebsite: organizationWebsite,
      isOngoing: isOngoing ?? this.isOngoing,
    );
  }
}
