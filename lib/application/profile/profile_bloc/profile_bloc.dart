import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/profile_model/profile_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service.dart';
import 'package:shareinfo/presentation/root_widget.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService _profileService;
  final TokenCubit tokenCubit;

  ProfileBloc(this._profileService, this.tokenCubit) : super(const _Initial()) {
    ProfileModel? profileModel;

    on<_GetUserProfileData>(
      (event, emit) async {
        if (profileModel != null) return;
        emit(const ProfileState.loadingProfile());
        final result = await _profileService.getProfileInfo();
        result.fold(
          (error) => emit(ProfileState.error(error)),
          (successList) {
            ///Saving email address in local storage
            if (auth.authInfo.value.email == null) {
              auth.authInfo.value =
                  auth.authInfo.value.copyWith(email: successList.email);
            }
            profileModel = successList;
            emit(ProfileState.profileSuccess(profileModel!));
          },
        );
      },
    );

    //Refresh profile
    on<_RefreshProfile>(
      (event, emit) async {
        emit(const ProfileState.loadingProfile());
        final result = await _profileService.getProfileInfo();
        result.fold(
          (error) => emit(ProfileState.error(error)),
          (successList) {
            ///Saving email address in local storage
            if (auth.authInfo.value.email == null) {
              auth.authInfo.value =
                  auth.authInfo.value.copyWith(email: successList.email);
            }
            profileModel = successList;
            emit(ProfileState.profileSuccess(profileModel!));
          },
        );
      },
    );

    on<_ClearModel>(
      (event, emit) {
        profileModel = null;
        emit(const ProfileState.initial());
      },
    );
  }
}
