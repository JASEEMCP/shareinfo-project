import 'package:json_annotation/json_annotation.dart';

part 'enrolled_detailed_view_model.g.dart';

@JsonSerializable()
class EnrolledDetailedViewModel {
  @JsonKey(name: 'practice_id')
  String? practiceId;
  @JsonKey(name: 'banner_image')
  String? bannerImage;
  @JsonKey(name: 'practice_task')
  String? practiceTask;
  String? description;
  @JsonKey(name: 'sub_categories')
  List<String>? subCategories;
  @JsonKey(name: 'no_process')
  int? noProcess;
  @JsonKey(name: 'active_process')
  int? activeProcess;
  @JsonKey(name: 'is_ongoing')
  bool? isOngoing;
  @JsonKey(name: 'is_submit')
  bool? isSubmit;
  @JsonKey(name: 'is_review_pending')
  bool? isReviewPending;
  @JsonKey(name: 'no_days_left')
  int? noDaysLeft;

  EnrolledDetailedViewModel({
    this.practiceId,
    this.bannerImage,
    this.practiceTask,
    this.description,
    this.subCategories,
    this.noProcess,
    this.activeProcess,
    this.isOngoing,
    this.isSubmit,
    this.isReviewPending,
    this.noDaysLeft,
  });

  factory EnrolledDetailedViewModel.fromJson(Map<String, dynamic> json) {
    return _$EnrolledDetailedViewModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EnrolledDetailedViewModelToJson(this);
}
