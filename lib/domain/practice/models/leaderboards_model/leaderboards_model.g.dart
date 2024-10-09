// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardsModel _$LeaderboardsModelFromJson(Map<String, dynamic> json) =>
    LeaderboardsModel(
      top20Candidates: (json['top_20_candidates'] as List<dynamic>?)
          ?.map((e) => LoggedInCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      loggedInCandidate: json['logged_in_candidate'] == null
          ? null
          : LoggedInCandidate.fromJson(
              json['logged_in_candidate'] as Map<String, dynamic>),
      top3Candidate: (json['top_3_candidate'] as List<dynamic>?)
          ?.map((e) => LoggedInCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      noOfCandidate: (json['no_of_candidate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeaderboardsModelToJson(LeaderboardsModel instance) =>
    <String, dynamic>{
      'top_20_candidates': instance.top20Candidates,
      'logged_in_candidate': instance.loggedInCandidate,
      'top_3_candidate': instance.top3Candidate,
      'no_of_candidate': instance.noOfCandidate,
    };
