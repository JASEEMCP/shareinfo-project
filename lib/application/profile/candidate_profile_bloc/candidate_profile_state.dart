part of 'candidate_profile_bloc.dart';

@freezed
class CandidateProfileState with _$CandidateProfileState {
  const factory CandidateProfileState({
    required bool isLoading,
    required CandidateProfileModel userData,
    required bool isSubmittingProfile,
    required bool isError,
    required MainFailure? e,
    required bool submissionSuccess,
    required bool isEdited,
  }) = _CandidateProfileState;
  factory CandidateProfileState.initial() {
    return CandidateProfileState(
      isLoading: false,
      userData: CandidateProfileModel(),
      isSubmittingProfile: false,
      isError: false,
      e: null,
      submissionSuccess: false,
      isEdited: false,
    );
  }
}
