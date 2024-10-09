import 'package:json_annotation/json_annotation.dart';

part 'logged_in_candidate.g.dart';

@JsonSerializable()
class LoggedInCandidate {
  @JsonKey(name: 'enrollment_id')
  String? enrollmentId;
  @JsonKey(name: 'candidate_id')
  int? candidateId;
  int? perks;
  @JsonKey(name: 'candidate_name')
  String? candidateName;
  @JsonKey(name: 'candidate_profile')
  String? candidateProfile;
  @JsonKey(name: 'time_duration')
  String? timeDuration;
  int? rank;

  LoggedInCandidate({
    this.enrollmentId,
    this.candidateId,
    this.perks,
    this.candidateName,
    this.candidateProfile,
    this.timeDuration,
    this.rank,
  });

  factory LoggedInCandidate.fromJson(Map<String, dynamic> json) {
    return _$LoggedInCandidateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoggedInCandidateToJson(this);
}
