// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_practice_leaderboards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificPracticeLeaderboards _$SpecificPracticeLeaderboardsFromJson(
        Map<String, dynamic> json) =>
    SpecificPracticeLeaderboards(
      top20Candidates: (json['top_20_candidates'] as List<dynamic>?)
          ?.map((e) => Top20Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      loggedInCandidate: json['logged_in_candidate'] == null
          ? null
          : LoggedInCandidate.fromJson(
              json['logged_in_candidate'] as Map<String, dynamic>),
      noDayLeft: (json['no_day_left'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpecificPracticeLeaderboardsToJson(
        SpecificPracticeLeaderboards instance) =>
    <String, dynamic>{
      'top_20_candidates': instance.top20Candidates,
      'logged_in_candidate': instance.loggedInCandidate,
      'no_day_left': instance.noDayLeft,
    };
