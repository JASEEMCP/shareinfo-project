import 'package:json_annotation/json_annotation.dart';

part 'enrolled_practice_list.g.dart';

@JsonSerializable()
class EnrolledPracticeList {
  @JsonKey(name: 'enrollment_id')
  String? id;
  @JsonKey(name: 'practice_id')
  String? practiceId;
  @JsonKey(name: 'practice_task')
  String? practiceTask;
  String? description;
  @JsonKey(name: 'is_ongoing')
  bool? isOngoing;
  @JsonKey(name: 'is_submit')
  bool? isSubmit;
  @JsonKey(name: 'is_submission_pending')
  bool? isSubmissionPending;
  @JsonKey(name: 'is_review_pending')
  bool? isReviewPending;
  @JsonKey(name: 'no_days_left')
  int? noDaysLeft;

  EnrolledPracticeList({
    this.id,
    this.practiceId,
    this.practiceTask,
    this.description,
    this.isOngoing,
    this.isSubmit,
    this.isSubmissionPending,
    this.isReviewPending,
    this.noDaysLeft,
  });

  factory EnrolledPracticeList.fromJson(Map<String, dynamic> json) {
    return _$EnrolledPracticeListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EnrolledPracticeListToJson(this);
}
