part of 'references_cubit.dart';

@freezed
class ReferencesState with _$ReferencesState {
  const factory ReferencesState({
    required bool isLoading,
    required ReferencesModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _ReferencesState;
  factory ReferencesState.initial() {
    return ReferencesState(
      deleteSuccess: false,
      isLoading: false,
      userModel: ReferencesModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
