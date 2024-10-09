// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInCandidate _$LoggedInCandidateFromJson(Map<String, dynamic> json) =>
    LoggedInCandidate(
      enrollmentId: json['enrollment_id'] as String?,
      candidateId: (json['candidate_id'] as num?)?.toInt(),
      perks: (json['perks'] as num?)?.toInt(),
      candidateName: json['candidate_name'] as String?,
      candidateProfile: json['candidate_profile'] as String?,
      timeDuration: json['time_duration'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoggedInCandidateToJson(LoggedInCandidate instance) =>
    <String, dynamic>{
      'enrollment_id': instance.enrollmentId,
      'candidate_id': instance.candidateId,
      'perks': instance.perks,
      'candidate_name': instance.candidateName,
      'candidate_profile': instance.candidateProfile,
      'time_duration': instance.timeDuration,
      'rank': instance.rank,
    };
