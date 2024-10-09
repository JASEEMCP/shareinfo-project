part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getUserProfileData() = _GetUserProfileData;
  const factory ProfileEvent.refreshProfile() = _RefreshProfile;
  const factory ProfileEvent.clearModel() = _ClearModel;
}
