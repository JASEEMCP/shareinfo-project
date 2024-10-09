part of 'affiliations_cubit.dart';

@freezed
class AffiliationsState with _$AffiliationsState {
  const factory AffiliationsState({
    required bool isLoading,
    required AffiliationsModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _AffiliationsState;

  factory AffiliationsState.initial() {
    return AffiliationsState(
      deleteSuccess: false,
      isLoading: false,
      userModel: AffiliationsModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
