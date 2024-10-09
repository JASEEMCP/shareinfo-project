import 'package:json_annotation/json_annotation.dart';

part 'top20_candidate.g.dart';

@JsonSerializable()
class Top20Candidate {
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

  Top20Candidate({
    this.enrollmentId,
    this.candidateId,
    this.perks,
    this.candidateName,
    this.candidateProfile,
    this.timeDuration,
    this.rank,
  });

  factory Top20Candidate.fromJson(Map<String, dynamic> json) {
    return _$Top20CandidateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$Top20CandidateToJson(this);
}
