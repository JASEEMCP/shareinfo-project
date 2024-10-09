part of 'education_cubit.dart';

@freezed
class EducationState with _$EducationState {
  const factory EducationState({
    required bool isLoading,
    required EducationModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _EducationState;

  factory EducationState.initial() {
    return EducationState(
      deleteSuccess: false,
      isLoading: false,
      userModel: EducationModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
