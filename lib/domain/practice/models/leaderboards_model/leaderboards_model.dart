import 'package:json_annotation/json_annotation.dart';

import 'logged_in_candidate.dart';

part 'leaderboards_model.g.dart';

@JsonSerializable()
class LeaderboardsModel {
  @JsonKey(name: 'top_20_candidates')
  List<LoggedInCandidate>? top20Candidates;
  @JsonKey(name: 'logged_in_candidate')
  LoggedInCandidate? loggedInCandidate;
  @JsonKey(name: 'top_3_candidate')
  List<LoggedInCandidate>? top3Candidate;
  @JsonKey(name: 'no_of_candidate')
  int? noOfCandidate;

  LeaderboardsModel({
    this.top20Candidates,
    this.loggedInCandidate,
    this.top3Candidate,
    this.noOfCandidate,
  });

  factory LeaderboardsModel.fromJson(Map<String, dynamic> json) {
    return _$LeaderboardsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeaderboardsModelToJson(this);
}
