part of 'language_cubit.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({
    required bool isLoading,
    required LanguageSet userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _LanguageState;
  factory LanguageState.initial() {
    return LanguageState(
      deleteSuccess: false,
      isLoading: false,
      userModel: LanguageSet(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
