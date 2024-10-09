part of 'candidate_profile_bloc.dart';

@freezed
class CandidateProfileEvent with _$CandidateProfileEvent {
  const factory CandidateProfileEvent.getCandidateProfile() =
      _GetCandidateProfile;
  const factory CandidateProfileEvent.clearProfilePicture() =
      _ClearProfilePicture;
  const factory CandidateProfileEvent.saveCandidateProfile(
      CandidateProfileModel model,
      Uint8List? imageBytes,
      bool isEdited,
      String? mediaType) = _SaveCandidateProfile;
}
