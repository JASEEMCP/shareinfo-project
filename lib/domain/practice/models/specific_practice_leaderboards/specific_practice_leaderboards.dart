import 'package:json_annotation/json_annotation.dart';

import 'logged_in_candidate.dart';
import 'top20_candidate.dart';

part 'specific_practice_leaderboards.g.dart';

@JsonSerializable()
class SpecificPracticeLeaderboards {
  @JsonKey(name: 'top_20_candidates')
  List<Top20Candidate>? top20Candidates;
  @JsonKey(name: 'logged_in_candidate')
  LoggedInCandidate? loggedInCandidate;
  @JsonKey(name: 'no_day_left')
  int? noDayLeft;

  SpecificPracticeLeaderboards({
    this.top20Candidates,
    this.loggedInCandidate,
    this.noDayLeft,
  });

  factory SpecificPracticeLeaderboards.fromJson(Map<String, dynamic> json) {
    return _$SpecificPracticeLeaderboardsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpecificPracticeLeaderboardsToJson(this);
}
