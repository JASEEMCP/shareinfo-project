import 'package:json_annotation/json_annotation.dart';

part 'certificate_model.g.dart';

@JsonSerializable()
class CertificateModel {
  int? id;
  String? name;
  @JsonKey(name: 'issuing_organization')
  String? issuingOrganization;
  @JsonKey(name: 'issue_date')
  String? issueDate;
  @JsonKey(name: 'expiration_date')
  String? expirationDate;
  @JsonKey(name: 'credential_id')
  String? credentialId;
  @JsonKey(name: 'credential_url')
  String? credentialUrl;
  @JsonKey(name: "media_name")
  String? mediaName;
  String? media;
  bool? expires;

  CertificateModel({
    this.id,
    this.name,
    this.issuingOrganization,
    this.issueDate,
    this.expirationDate,
    this.credentialId,
    this.credentialUrl,
    this.media,
    this.expires,
    this.mediaName,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return _$CertificateModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CertificateModelToJson(this);
  Map<String, dynamic> createDataToJson() {
    return {
      'name': name,
      'issuing_organization': issuingOrganization,
      'issue_date': issueDate,
      'expiration_date': expirationDate,
      'credential_id': credentialId,
      'credential_url': credentialUrl,
      'media': media,
      'expires': expires,
      'media_name': mediaName,
    };
  }

  CertificateModel copyWith({
    int? id,
    String? name,
    String? issuingOrganization,
    String? issueDate,
    String? expirationDate,
    String? credentialId,
    String? credentialUrl,
    String? media,
    bool? expires,
    String? mediaName,
  }) {
    return CertificateModel(
      id: id ?? this.id,
      name: name ?? this.name,
      issuingOrganization: issuingOrganization ?? this.issuingOrganization,
      issueDate: issueDate ?? this.issueDate,
      expirationDate: expirationDate ?? this.expirationDate,
      credentialId: credentialId,
      credentialUrl: credentialUrl,
      media: media ?? this.media,
      expires: expires ?? this.expires,
      mediaName: mediaName ?? this.mediaName,
    );
  }
}
