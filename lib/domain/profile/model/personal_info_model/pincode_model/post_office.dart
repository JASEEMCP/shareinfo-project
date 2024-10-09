import 'package:json_annotation/json_annotation.dart';

part 'post_office.g.dart';

@JsonSerializable()
class PostOffice {
  @JsonKey(name: 'District')
  String? district;
  @JsonKey(name: 'Division')
  String? division;
  String? block;
  @JsonKey(name: 'State')
  String? state;
  @JsonKey(name: 'Pincode')
  String? pincode;

  PostOffice({
    this.district,
    this.division,
    this.block,
    this.state,
    this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return _$PostOfficeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostOfficeToJson(this);

  PostOffice copyWith({
    String? name,
    dynamic description,
    String? branchType,
    String? deliveryStatus,
    String? circle,
    String? district,
    String? division,
    String? region,
    String? block,
    String? state,
    String? country,
    String? pincode,
  }) {
    return PostOffice(
      district: district ?? this.district,
      division: division ?? this.division,
      block: block ?? this.block,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
    );
  }
}
