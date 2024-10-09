part of 'cv_resume_cubit.dart';

@freezed
class CvResumeState with _$CvResumeState {
  const factory CvResumeState({
    required bool isLoading,
    required CvResumeSet cvInfo,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _CvResumeState;

  factory CvResumeState.initial() {
    return CvResumeState(
      deleteSuccess: false,
      isLoading: false,
      cvInfo: CvResumeSet(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
