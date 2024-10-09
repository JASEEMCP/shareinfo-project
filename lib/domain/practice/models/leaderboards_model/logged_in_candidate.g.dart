// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInCandidate _$LoggedInCandidateFromJson(Map<String, dynamic> json) =>
    LoggedInCandidate(
      totalPerks: (json['total_perks'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      candidateName: json['candidate_name'] as String?,
      candidateProfile: json['candidate_profile'] as String?,
    );

Map<String, dynamic> _$LoggedInCandidateToJson(LoggedInCandidate instance) =>
    <String, dynamic>{
      'total_perks': instance.totalPerks,
      'rank': instance.rank,
      'candidate_name': instance.candidateName,
      'candidate_profile': instance.candidateProfile,
    };
