import 'package:json_annotation/json_annotation.dart';

part 'personal_info_model.g.dart';

@JsonSerializable()
class PersonalInfoModel {
  @JsonKey(name: 'phone_no')
  String? phoneNo;
  String? email;
  String? dob;
  String? gender;
  String? address;
  @JsonKey(name: 'postal_pin')
  int? postalPin;
  String? city;
  String? district;
  String? state;

  PersonalInfoModel({
    this.phoneNo,
    this.email,
    this.dob,
    this.gender,
    this.address,
    this.postalPin,
    this.city,
    this.district,
    this.state,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return _$PersonalInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);

  PersonalInfoModel copyWith({
    String? phoneNo,
    String? email,
    String? dob,
    String? gender,
    String? address,
    int? postalPin,
    String? city,
    String? district,
    String? state,
  }) {
    return PersonalInfoModel(
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      postalPin: postalPin ?? this.postalPin,
      city: city ?? this.city,
      district: district ?? this.district,
      state: state ?? this.state,
    );
  }
}
