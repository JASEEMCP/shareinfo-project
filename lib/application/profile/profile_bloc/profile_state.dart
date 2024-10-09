part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loadingProfile() = _LoadingProfile;
  const factory ProfileState.profileSuccess(ProfileModel model) =
      _ProfileSuccess;
  const factory ProfileState.error(MainFailure e) = _Error;
}

extension ProfileStateX on ProfileState {
  bool get isLoading => this is _LoadingProfile;
  bool get isError => this is _Error;
}
