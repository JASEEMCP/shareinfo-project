import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/profile/common/shared_states.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/common/azure_storage_util.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/storage_failure.dart';
import 'package:shareinfo/domain/profile/model/profile_model/cv_resume_set.dart';
import 'package:shareinfo/domain/profile/service/profile_service_2.dart';

@LazySingleton()
class UpdateCvResumeCubit extends Cubit<SharedState> {
  final ProfileManageService _profileService2;
  final AzureStorageService _azureStorageService;
  UpdateCvResumeCubit(this._profileService2, this._azureStorageService)
      : super(const SharedState.initial());

  /// Update/Save resume
  Future<void> updateResume(Uint8List? fileBytes, CvResumeSet newModel,
      DioMethodType type, String? mediaName,
      {required isEdited}) async {
    CvResumeSet model = CvResumeSet();

    //No action is following if file is not edited
    if (!isEdited) return;
    emit(const SharedState.uploading(0.1));
    // Assign current model data
    model = newModel;
    // Assign media Name
    model.mediaName = mediaName;

    /// Storage path that storing into db
    String? storagePath;

    /// Generated unique file name that storing into db
    String? genFileName;

    // Checking given file is new
    if (model.cv == null) {
      genFileName = generateUniqueFileName('doc');
    } else {
      genFileName = model.cv!.split('/').last;
    }

    // Upload file into azure storage
    // Response be like dir path dir_path/filename
    final uploadResp = await _azureStorageService.uploadDocument(
      fileBytes,
      BlobDir.cvResume,
      genFileName,
      (sent, total) {
        emit(SharedState.uploading(sent / total));
      },
    );

    /// if Uploading content is fail
    if (uploadResp.isLeft()) {
      return emit(
          const SharedState.storageError(StorageFailure.uploadFailed()));
    }

    // Retrieving storage path
    storagePath = uploadResp.fold(
      (_) => null,
      (r) {
        /// return storage path
        return r;
      },
    );

    /// Updating resume path
    model.cv = storagePath;

    /// Updating DB
    final result = await _profileService2.updateResume(model, type);

    result.fold(
      (error) async {
        //deleting file in blob storage
        //prevent to store unused file
        await _azureStorageService.deleteDocument(
          BlobDir.cvResume,
          storagePath!.split('/').last,
        );
        emit(SharedState.error(error));
      },
      (userData) async {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());

        emit(const SharedState.success());
      },
    );
  }
}
