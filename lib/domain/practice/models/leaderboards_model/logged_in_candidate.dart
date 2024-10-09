import 'package:json_annotation/json_annotation.dart';

part 'logged_in_candidate.g.dart';

@JsonSerializable()
class LoggedInCandidate {
  @JsonKey(name: 'total_perks')
  int? totalPerks;
  int? rank;
  @JsonKey(name: 'candidate_name')
  String? candidateName;
  @JsonKey(name: 'candidate_profile')
  String? candidateProfile;

  LoggedInCandidate({
    this.totalPerks,
    this.rank,
    this.candidateName,
    this.candidateProfile,
  });

  factory LoggedInCandidate.fromJson(Map<String, dynamic> json) {
    return _$LoggedInCandidateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoggedInCandidateToJson(this);
}
