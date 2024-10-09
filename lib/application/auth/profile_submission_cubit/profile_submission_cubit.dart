import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/auth/token_cubit/token_cubit.dart';
import 'package:shareinfo/domain/auth/model/pre_profile_model/pre_profile_model.dart';
import 'package:shareinfo/domain/auth/service/pre_profile_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/presentation/root_widget.dart';

part 'profile_submission_state.dart';
part 'profile_submission_cubit.freezed.dart';

@lazySingleton
class ProfileSubmissionCubit extends Cubit<ProfileSubmissionState> {
  final TokenCubit _tokenCubit;
  final PreProfileService _preProfileService;

  ProfileSubmissionCubit(
    this._tokenCubit,
    this._preProfileService,
  ) : super(const ProfileSubmissionState.initial());

  ///create profile
  Future<void> submitProfile(
    PreProfileModel model, {
    required bool isStudent,
  }) async {
    emit(const ProfileSubmissionState.isSubmitting());

    final result =
        await _preProfileService.submitPreProfile(model, isStudent: isStudent);

    result.fold(
      ///Emitting auth exception
      (authError) async {
        emit(ProfileSubmissionState.submissionError(authError));
      },

      ///Emit success state
      (success) {
        auth.authInfo.value =
            auth.authInfo.value.copyWith(isStudent: success['is_student']);

        ///Assign value  [isProfileCompleted] into [true]
        _tokenCubit.setPreProfileValue();
        emit(const ProfileSubmissionState.profileCreated());
      },
    );
  }
}
