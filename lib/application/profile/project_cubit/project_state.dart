part of 'project_cubit.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState({
    required bool isLoading,
    required ProjectModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _EducationState;

  factory ProjectState.initial() {
    return ProjectState(
      deleteSuccess: false,
      isLoading: false,
      userModel: ProjectModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
