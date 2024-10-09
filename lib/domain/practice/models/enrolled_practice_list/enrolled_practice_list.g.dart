// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_practice_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledPracticeList _$EnrolledPracticeListFromJson(
        Map<String, dynamic> json) =>
    EnrolledPracticeList(
      id: json['enrollment_id'] as String?,
      practiceId: json['practice_id'] as String?,
      practiceTask: json['practice_task'] as String?,
      description: json['description'] as String?,
      isOngoing: json['is_ongoing'] as bool?,
      isSubmit: json['is_submit'] as bool?,
      isSubmissionPending: json['is_submission_pending'] as bool?,
      isReviewPending: json['is_review_pending'] as bool?,
      noDaysLeft: (json['no_days_left'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EnrolledPracticeListToJson(
        EnrolledPracticeList instance) =>
    <String, dynamic>{
      'enrollment_id': instance.id,
      'practice_id': instance.practiceId,
      'practice_task': instance.practiceTask,
      'description': instance.description,
      'is_ongoing': instance.isOngoing,
      'is_submit': instance.isSubmit,
      'is_submission_pending': instance.isSubmissionPending,
      'is_review_pending': instance.isReviewPending,
      'no_days_left': instance.noDaysLeft,
    };
