import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/project_model/project_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_2.dart';

part 'project_state.dart';
part 'project_cubit.freezed.dart';

@lazySingleton
class ProjectCubit extends Cubit<ProjectState> {
  final ProfileManageService _profileManageService;
  final FilePickerCubit _filePickerCubit;
  final AzureStorageService _azureStorageService;
  ProjectCubit(
    this._profileManageService,
    this._filePickerCubit,
    this._azureStorageService,
  ) : super(ProjectState.initial());

  ProjectModel model = ProjectModel();

  Future<void> retrieveProjectInfo(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService.getProjectInfo(id);
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

  Future<void> saveProjectInfo(ProjectModel temp, Uint8List? fileBytes,
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
      model.mediaName = mediaName;
      // Checking given file is new
      if (model.media == null) {
        genFileName = generateUniqueFileName('doc');
      } else {
        genFileName = model.media!.split('/').last;
      }

      // Upload file into azure storage
      // Response be like dir path dir_path/filename
      final uploadResp = await _azureStorageService.uploadDocument(
          fileBytes, BlobDir.projects, genFileName, (sent, total) {});

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

    // Updating DB
    final result = await _profileManageService.updateProjectInfo(model, type);
    result.fold(
      (error) async {
        //deleting file in blob storage
        //prevent to store unused file
        await _azureStorageService.deleteDocument(
          BlobDir.projects,
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
  Future<void> deleteProjectInfo(String? path) async {
    emit(state.copyWith(saveSuccess: false));

    //Deleting data in storage
    final uploadResp = await _azureStorageService.deleteDocument(
      BlobDir.projects,
      path!.split('/').last,
    );

    //Check response is success or not
    if (uploadResp.isLeft()) return;

    final result = await _profileManageService.updateProjectInfo(
      model,
      DioMethodType.delete,
    );
    result.fold(
      (error) {
        emit(
          state.copyWith(
            error: error,
            isError: true,
            deleteSuccess: false,
          ),
        );
      },
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
    model = ProjectModel();
    emit(ProjectState.initial());
    return;
  }
}
