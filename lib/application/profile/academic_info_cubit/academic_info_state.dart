part of 'academic_info_cubit.dart';

@freezed
class AcademicInfoState with _$AcademicInfoState {
  const factory AcademicInfoState({
    required bool isLoading,
    required AcademicInfoModel userData,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
  }) = _AcademicInfoState;
  factory AcademicInfoState.initial() {
    return AcademicInfoState(
      isLoading: false,
      userData: AcademicInfoModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
