import 'package:json_annotation/json_annotation.dart';

part 'personal_information.g.dart';

@JsonSerializable()
class PersonalInformation {
  String? address;
  String? dob;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'phone_no')
  String? phoneNo;
  String? email;

  PersonalInformation({this.address, this.dob, this.phoneNo, this.email});

  factory PersonalInformation.fromJson(Map<String, dynamic> json) {
    return _$PersonalInformationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalInformationToJson(this);
}
