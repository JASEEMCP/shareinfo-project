import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/auth/token_cubit/token_cubit.dart';
import 'package:shareinfo/application/profile/common/shared_states.dart';
import 'package:shareinfo/domain/auth/model/pre_profile_model/pre_profile_model.dart';
import 'package:shareinfo/domain/auth/service/pre_profile_service.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/common/azure_storage_util.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/failures/storage_failure.dart';
import 'package:shareinfo/presentation/root_widget.dart';

@lazySingleton
class StudentProfileSubmissionCubit extends Cubit<SharedState> {
  final TokenCubit _tokenCubit;
  final PreProfileService _preProfileService;
  final AzureStorageService _azureStorageService;
  StudentProfileSubmissionCubit(
    this._tokenCubit,
    this._preProfileService,
    this._azureStorageService,
  ) : super(const SharedState.initial());

  ///create profile
  Future<void> submitProfile(
    PreProfileModel model, {
    required bool isStudent,
    Uint8List? frontView,
    Uint8List? backView,
    String? mediaTypeFront,
    String? mediaTypeBack,
  }) async {
    emit(const SharedState.uploading(0.1));

    if (frontView != null && backView != null) {
      //Uploading student id
      final [front, back] = await Future.wait([
        _azureStorageService.uploadImage(
          frontView,
          BlobDir.studentId,
          'user-id-front.$mediaTypeFront',
          mediaTypeFront ?? '',
          (sent, total) {},
        ),
        _azureStorageService.uploadImage(
          backView,
          BlobDir.studentId,
          'user-id-back.$mediaTypeBack',
          mediaTypeBack ?? '',
          (sent, total) {},
        )
      ]);

      if (front.isLeft() || back.isLeft()) {
        model.idFront = null;
        model.idBack = null;

        return emit(
          const SharedState.storageError(StorageFailure.uploadFailed()),
        );
      }
      model.idFront = front.fold((_) => null, (path) => path);
      model.idBack = back.fold((_) => null, (path) => path);
    }

    final result =
        await _preProfileService.submitPreProfile(model, isStudent: isStudent);

    result.fold(
      ///Emitting auth exception
      (authError) async {
        //Deleting already uploaded data
        await Future.wait(
          [
            _azureStorageService.deleteImage(
                BlobDir.studentId, 'user-id-front.$mediaTypeFront'),
            _azureStorageService.deleteImage(
                BlobDir.studentId, 'user-id-back.$mediaTypeBack'),
          ],
        );

        emit(const SharedState.error(MainFailure.clientError()));
      },

      ///Emit success state
      (success) {
        auth.authInfo.value =
            auth.authInfo.value.copyWith(isStudent: success['is_student']);

        ///Assign value  [isProfileCompleted] into [true]
        _tokenCubit.setPreProfileValue();
        emit(const SharedState.success());
      },
    );
  }
}
