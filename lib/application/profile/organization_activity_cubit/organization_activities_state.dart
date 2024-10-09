part of 'organization_activities_cubit.dart';

@freezed
class OrganizationActivitiesState with _$OrganizationActivitiesState {
  const factory OrganizationActivitiesState({
    required bool isLoading,
    required OrganizationActivityModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _OrganizationActivitiesState;

  factory OrganizationActivitiesState.initial() {
    return OrganizationActivitiesState(
      deleteSuccess: false,
      isLoading: false,
      userModel: OrganizationActivityModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
