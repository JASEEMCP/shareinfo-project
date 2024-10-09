part of 'professional_exam_cubit.dart';

@freezed
class ProfessionalExamState with _$ProfessionalExamState {
  const factory ProfessionalExamState({
    required bool isLoading,
    required ProfessionalExamModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _ProfessionalExamState;

  factory ProfessionalExamState.initial() {
    return ProfessionalExamState(
      deleteSuccess: false,
      isLoading: false,
      userModel: ProfessionalExamModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
