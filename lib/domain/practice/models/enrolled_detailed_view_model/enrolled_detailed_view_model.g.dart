// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_detailed_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledDetailedViewModel _$EnrolledDetailedViewModelFromJson(
        Map<String, dynamic> json) =>
    EnrolledDetailedViewModel(
      practiceId: json['practice_id'] as String?,
      bannerImage: json['banner_image'] as String?,
      practiceTask: json['practice_task'] as String?,
      description: json['description'] as String?,
      subCategories: (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      noProcess: (json['no_process'] as num?)?.toInt(),
      activeProcess: (json['active_process'] as num?)?.toInt(),
      isOngoing: json['is_ongoing'] as bool?,
      isSubmit: json['is_submit'] as bool?,
      isReviewPending: json['is_review_pending'] as bool?,
      noDaysLeft: (json['no_days_left'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EnrolledDetailedViewModelToJson(
        EnrolledDetailedViewModel instance) =>
    <String, dynamic>{
      'practice_id': instance.practiceId,
      'banner_image': instance.bannerImage,
      'practice_task': instance.practiceTask,
      'description': instance.description,
      'sub_categories': instance.subCategories,
      'no_process': instance.noProcess,
      'active_process': instance.activeProcess,
      'is_ongoing': instance.isOngoing,
      'is_submit': instance.isSubmit,
      'is_review_pending': instance.isReviewPending,
      'no_days_left': instance.noDaysLeft,
    };
