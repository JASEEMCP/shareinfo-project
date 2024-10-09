part of 'personal_info_cubit.dart';

@freezed
class PersonalInfoState with _$PersonalInfoState {
  const factory PersonalInfoState({
    required bool isLoading,
    required PersonalInfoModel userData,
    required SummaryModel summaryText,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool fetchingPincode,
  }) = _PersonalInfoState;
  factory PersonalInfoState.initial() {
    return PersonalInfoState(
      summaryText: SummaryModel(),
      isLoading: false,
      userData: PersonalInfoModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
      fetchingPincode: false,
    );
  }
}
