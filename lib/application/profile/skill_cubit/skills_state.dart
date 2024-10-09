part of 'skills_cubit.dart';

@freezed
class SkillsState with _$SkillsState {
  const factory SkillsState({
    required bool isLoading,
    required List<SkillSet> userModel,
    required List<SkillSet> searchList,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
    required bool searchSuccess,
  }) = _SkillsState;
  factory SkillsState.initial() {
    return const SkillsState(
      searchSuccess: false,
      deleteSuccess: false,
      isLoading: false,
      userModel: [],
      searchList: [],
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
