import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_list_model.g.dart';

@JsonSerializable()
class DomainListModel {
  int? id;
  @JsonKey(name: 'domain_name')
  String? domainName;

  DomainListModel({
    this.id,
    this.domainName,
  });

  factory DomainListModel.fromJson(Map<String, dynamic> json) {
    return _$DomainListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DomainListModelToJson(this);
}
