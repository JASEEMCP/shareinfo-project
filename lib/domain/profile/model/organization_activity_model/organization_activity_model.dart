import 'package:json_annotation/json_annotation.dart';

part 'organization_activity_model.g.dart';

@JsonSerializable()
class OrganizationActivityModel {
  int? id;
  String? organization;
  String? role;
  @JsonKey(name: 'from_date')
  String? fromDate;
  @JsonKey(name: 'to_date')
  String? toDate;
  String? description;
  @JsonKey(name: 'id_card')
  String? idCard;
  @JsonKey(name: 'is_ongoing')
  bool? isOngoing;
  @JsonKey(name: "media_name")
  String? mediaName;

  OrganizationActivityModel({
    this.id,
    this.organization,
    this.role,
    this.fromDate,
    this.toDate,
    this.description,
    this.idCard,
    this.isOngoing,
    this.mediaName,
  });

  factory OrganizationActivityModel.fromJson(Map<String, dynamic> json) {
    return _$OrganizationActivityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrganizationActivityModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'organization': organization,
      'role': role,
      'from_date': fromDate,
      'to_date': toDate,
      'description': description,
      'id_card': idCard,
      'is_ongoing': isOngoing,
      'media_name': mediaName,
    };
  }

  OrganizationActivityModel copyWith({
    int? id,
    String? organization,
    String? role,
    String? fromDate,
    String? toDate,
    String? description,
    String? idCard,
    bool? isOngoing,
    String? mediaName,
  }) {
    return OrganizationActivityModel(
      id: id ?? this.id,
      organization: organization ?? this.organization,
      role: role,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      description: description,
      idCard: idCard ?? this.idCard,
      isOngoing: isOngoing ?? this.isOngoing,
      mediaName: mediaName ?? this.mediaName,
    );
  }
}
