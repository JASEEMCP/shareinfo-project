part of 'volunteering_experience_cubit.dart';

@freezed
class VolunteeringExperienceState with _$VolunteeringExperienceState {
  const factory VolunteeringExperienceState({
    required bool isLoading,
    required VolunteeringExpModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _VolunteeringExperienceState;

  factory VolunteeringExperienceState.initial() {
    return VolunteeringExperienceState(
      deleteSuccess: false,
      isLoading: false,
      userModel: VolunteeringExpModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
