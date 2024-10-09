import 'package:json_annotation/json_annotation.dart';

part 'candidate_profile_model.g.dart';

@JsonSerializable()
class CandidateProfileModel {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'middle_name')
  String? middleName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'profile_photo')
  String? profilePhoto;
  @JsonKey(name: 'current_position')
  String? currentPosition;
  @JsonKey(name: 'current_organization')
  String? currentOrganization;

  CandidateProfileModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.profilePhoto,
    this.currentPosition,
    this.currentOrganization,
  });

  factory CandidateProfileModel.fromJson(Map<String, dynamic> json) {
    return _$CandidateProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CandidateProfileModelToJson(this);

  CandidateProfileModel copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? profilePhoto,
    String? currentPosition,
    String? currentOrganization,
  }) {
    return CandidateProfileModel(
      firstName: firstName ?? this.firstName,
      middleName: middleName,
      lastName: lastName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      currentPosition: currentPosition ?? this.currentPosition,
      currentOrganization: currentOrganization,
    );
  }
}
