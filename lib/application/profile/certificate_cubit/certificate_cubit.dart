import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/certificate_model/certificate_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_2.dart';

part 'certificate_state.dart';
part 'certificate_cubit.freezed.dart';

@lazySingleton
class CertificateCubit extends Cubit<CertificateState> {
  final ProfileManageService _profileManageService;
  final FilePickerCubit _filePickerCubit;
  final AzureStorageService _azureStorageService;
  CertificateCubit(
    this._profileManageService,
    this._filePickerCubit,
    this._azureStorageService,
  ) : super(CertificateState.initial());
  CertificateModel model = CertificateModel();

  Future<void> retrieveCertificateInfo(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService.getCertificateInfo(id);
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isLoading: false,
        ),
      ),
      (userData) async {
        model = userData;

        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            userModel: model,
          ),
        );

        ///The given file endpoint from database does not mention file type
        await _filePickerCubit.loadFile(model.mediaName, model.media);
      },
    );
  }

  Future<void> saveCertificateInfo(CertificateModel temp, Uint8List? fileBytes,
      DioMethodType type, String? mediaName,
      {required isEdited}) async {
    model = temp;

    emit(
      state.copyWith(
        isSaving: true,
        userModel: model,
        saveSuccess: false,
        deleteSuccess: false,
      ),
    );

    /// Storage path that storing into db
    String? storagePath;

    /// Generated unique file name that storing into db
    String? genFileName;

    // Upload file into azure storage
    // Response be like dir path dir_path/filename
    // Only upload image when user is edited their file
    if (isEdited) {
      // Saving media file name
      model.mediaName = mediaName;
      // Checking given file is new
      if (model.media == null) {
        genFileName = generateUniqueFileName('doc');
      } else {
        genFileName = model.media!.split('/').last;
      }
      final uploadResp = await _azureStorageService.uploadDocument(
          fileBytes, BlobDir.certificate, genFileName, (sent, total) {});

      /// if Uploading content is fail
      if (uploadResp.isLeft()) return;

      // Retrieving storage path
      storagePath = uploadResp.fold(
        (_) => null,
        (r) {
          /// return storage path
          return r;
        },
      );

      /// Updating file path
      model.media = storagePath;
    }

    final result =
        await _profileManageService.updateCertificateInfo(model, type);

    result.fold(
      (error) async {
        //deleting file in blob storage
        //prevent to store unused file
        await _azureStorageService.deleteDocument(
          BlobDir.certificate,
          storagePath!.split('/').last,
        );

        emit(
          state.copyWith(
            error: error,
            isError: true,
            isSaving: false,
            saveSuccess: false,
          ),
        );
      },
      (_) async {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isSaving: false,
            isError: false,
            saveSuccess: true,
            userModel: model,
          ),
        );
      },
    );
  }

//Delete profile data
  Future<void> deleteCertificate(String? path) async {
    emit(state.copyWith(saveSuccess: false));

    //Deleting data in storage
    final uploadResp = await _azureStorageService.deleteDocument(
      BlobDir.certificate,
      path!.split('/').last,
    );

    //Check response is success or not
    if (uploadResp.isLeft()) return;

    final result = await _profileManageService.updateCertificateInfo(
      model,
      DioMethodType.delete,
    );
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          deleteSuccess: false,
        ),
      ),
      (_) async {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isError: false,
            deleteSuccess: true,
          ),
        );
      },
    );
  }

  ///replace every data into null
  void clearData() {
    model = CertificateModel();
    emit(CertificateState.initial());
    return;
  }
}
