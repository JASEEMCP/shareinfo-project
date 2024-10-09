part of 'work_experience_cubit.dart';

@freezed
class WorkExperienceState with _$WorkExperienceState {
  const factory WorkExperienceState({
    required bool isLoading,
    required WorkExperienceModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _WorkExperienceState;

  factory WorkExperienceState.initial() {
    return WorkExperienceState(
      deleteSuccess: false,
      isLoading: false,
      userModel: WorkExperienceModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
