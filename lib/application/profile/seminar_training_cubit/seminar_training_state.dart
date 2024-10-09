part of 'seminar_training_cubit.dart';

@freezed
class SeminarTrainingState with _$SeminarTrainingState {
  const factory SeminarTrainingState({
    required bool isLoading,
    required SeminarTrainingModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _SeminarTrainingState;

  factory SeminarTrainingState.initial() {
    return SeminarTrainingState(
      deleteSuccess: false,
      isLoading: false,
      userModel: SeminarTrainingModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
