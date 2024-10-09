// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top20_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Top20Candidate _$Top20CandidateFromJson(Map<String, dynamic> json) =>
    Top20Candidate(
      enrollmentId: json['enrollment_id'] as String?,
      candidateId: (json['candidate_id'] as num?)?.toInt(),
      perks: (json['perks'] as num?)?.toInt(),
      candidateName: json['candidate_name'] as String?,
      candidateProfile: json['candidate_profile'] as String?,
      timeDuration: json['time_duration'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Top20CandidateToJson(Top20Candidate instance) =>
    <String, dynamic>{
      'enrollment_id': instance.enrollmentId,
      'candidate_id': instance.candidateId,
      'perks': instance.perks,
      'candidate_name': instance.candidateName,
      'candidate_profile': instance.candidateProfile,
      'time_duration': instance.timeDuration,
      'rank': instance.rank,
    };
