import 'package:json_annotation/json_annotation.dart';

part 'references_model.g.dart';

@JsonSerializable()
class ReferencesModel {
  int? id;
  String? name;
  String? role;
  String? organization;
  String? email;
  @JsonKey(name: 'phone_no')
  String? phoneNo;
  String? description;

  ReferencesModel({
    this.id,
    this.name,
    this.role,
    this.organization,
    this.email,
    this.phoneNo,
    this.description,
  });

  factory ReferencesModel.fromJson(Map<String, dynamic> json) {
    return _$ReferencesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReferencesModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'name': name,
      'role': role,
      'organization': organization,
      'email': email,
      'phone_no': phoneNo,
      'description': description,
    };
  }

  ReferencesModel copyWith({
    int? id,
    String? name,
    String? role,
    String? organization,
    String? email,
    String? phoneNo,
    String? description,
  }) {
    return ReferencesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      organization: organization ?? this.organization,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      description: description,
    );
  }
}
