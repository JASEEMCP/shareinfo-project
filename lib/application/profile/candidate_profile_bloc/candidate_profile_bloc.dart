import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/common/image_picker_cubit/image_picker_cubit.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/common/azure_storage_util.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/failures/storage_failure.dart';
import 'package:shareinfo/domain/profile/model/candidate_profile_model/candidate_profile_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service.dart';
import 'package:shareinfo/presentation/root_widget.dart';

part 'candidate_profile_event.dart';
part 'candidate_profile_state.dart';
part 'candidate_profile_bloc.freezed.dart';

@lazySingleton
class CandidateProfileBloc
    extends Bloc<CandidateProfileEvent, CandidateProfileState> {
  final ProfileService _profileService;
  final AzureStorageService _azureStorageService;
  CandidateProfileModel model = CandidateProfileModel();

  CandidateProfileBloc(
    this._profileService,
    this._azureStorageService,
  ) : super(CandidateProfileState.initial()) {
    ///Getting candidate info
    on<_GetCandidateProfile>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, submissionSuccess: false));
        final result = await _profileService.getCandidateProfileInfo();
        result.fold(
          (e) => emit(
            state.copyWith(
              e: e,
              isError: true,
              isLoading: false,
            ),
          ),
          (candidateData) {
            model = candidateData;
            emit(
              state.copyWith(
                isLoading: false,
                isError: false,
                userData: model,
              ),
            );

            /// Load image into starting time
            getIt<ImagePickerCubit>().loadImage(model.profilePhoto);
          },
        );
      },
    );

    ///Saving candidate profile
    on<_SaveCandidateProfile>(
      (event, emit) async {
        ///initially state is saving state
        model = event.model;
        Either<StorageFailure, String>? uploadResp;

        /// Store image upload result

        emit(
          state.copyWith(
            isSubmittingProfile: true,
            userData: model,
            submissionSuccess: false,
          ),
        );

        ///Check whether user is upload a new image
        ///checking user edited their user picture or not
        if (event.isEdited && event.imageBytes != null) {
          //This function work as upload new image and delete previous photo
          uploadResp = await _azureStorageService.uploadImage(
            event.imageBytes,
            BlobDir.userProfile,
            'image-user.${event.mediaType}',
            event.mediaType ?? 'jpg',
            (sent, total) {},
          );

          /// Retrieving dir path
          model.profilePhoto = uploadResp.fold(
            (l) => null,
            (path) {
              return path;
            },
          );
        }

        ///the user model data getting from the event
        final result = await _profileService.updateCandidateProfile(model);
        result.fold(
          (error) => emit(
            state.copyWith(
              isError: true,
              isSubmittingProfile: false,
              e: error,
              submissionSuccess: false,
            ),
          ),
          (user) {
            getIt<ImagePickerCubit>().loadImage(model.profilePhoto);
            getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());

            ///Saving first name and profile path  in local storage for global access
            auth.authInfo.value = auth.authInfo.value.copyWith(
              fullName: user.fullName,
              profilePhoto: model.profilePhoto,
            );
            updatingSASToken();
            emit(
              state.copyWith(
                userData: model,
                isSubmittingProfile: false,
                submissionSuccess: true,
                isEdited: false,
              ),
            );
          },
        );
      },
    );
  }
}
