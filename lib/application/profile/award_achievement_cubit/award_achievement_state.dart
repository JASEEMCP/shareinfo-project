part of 'award_achievement_cubit.dart';

@freezed
class AwardAchievementState with _$AwardAchievementState {
  const factory AwardAchievementState({
    required bool isLoading,
    required AwardAchievementModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _AwardAchievementState;

  factory AwardAchievementState.initial() {
    return AwardAchievementState(
      deleteSuccess: false,
      isLoading: false,
      userModel: AwardAchievementModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
