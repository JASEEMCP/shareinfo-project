import 'package:json_annotation/json_annotation.dart';

part 'personal_information_model.g.dart';

@JsonSerializable()
class PersonalInformationModel {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'middle_name')
  String? middleName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'phone_no')
  String? phoneNo;
  String? email;
  @JsonKey(name: 'current_position')
  String? currentPosition;
  String? dob;
  String? gender;
  String? state;

  PersonalInformationModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.phoneNo,
    this.email,
    this.currentPosition,
    this.dob,
    this.gender,
    this.state,
  });

  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalInformationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalInformationModelToJson(this);
}
