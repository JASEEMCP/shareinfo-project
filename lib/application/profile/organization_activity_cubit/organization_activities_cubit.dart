import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/profile/model/organization_activity_model/organization_activity_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_4.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'organization_activities_state.dart';
part 'organization_activities_cubit.freezed.dart';

@lazySingleton
class OrganizationActivitiesCubit extends Cubit<OrganizationActivitiesState> {
  final ProfileManageService3 _profileManageService3;
  final FilePickerCubit _filePickerCubit;
  final AzureStorageService _azureStorageService;
  OrganizationActivitiesCubit(
    this._profileManageService3,
    this._filePickerCubit,
    this._azureStorageService,
  ) : super(OrganizationActivitiesState.initial());

  OrganizationActivityModel model = OrganizationActivityModel();

  Future<void> retrieveOrganizationActivities(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService3.getOrganizationActivities(id);
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
        await _filePickerCubit.loadFile(model.mediaName, model.idCard);
      },
    );
  }

  Future<void> saveOrganizationActivities(OrganizationActivityModel temp,
      Uint8List? fileBytes, DioMethodType type, String? mediaName,
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
      // Assign media name
      model.mediaName = mediaName;
      // Checking given file is new
      if (model.idCard == null) {
        genFileName = generateUniqueFileName('doc');
      } else {
        genFileName = model.idCard!.split('/').last;
      }

      // Upload file into azure storage
      // Response be like dir path dir_path/filename
      final uploadResp = await _azureStorageService.uploadDocument(fileBytes,
          BlobDir.organizationActivities, genFileName, (sent, total) {});

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
      model.idCard = storagePath;
    }

    /// Update DB
    final result =
        await _profileManageService3.updateOrganizationActivities(model, type);
    result.fold(
      (error) async {
        //deleting file in blob storage
        //prevent to store unused file
        await _azureStorageService.deleteDocument(
          BlobDir.organizationActivities,
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
  Future<void> deleteOrganizationActivities(String? path) async {
    emit(state.copyWith(saveSuccess: false));

    //Deleting data in storage
    final uploadResp = await _azureStorageService.deleteDocument(
      BlobDir.organizationActivities,
      path!.split('/').last,
    );

    //Check response is success or not
    if (uploadResp.isLeft()) return;
    final result = await _profileManageService3.updateOrganizationActivities(
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
    model = OrganizationActivityModel();
    emit(OrganizationActivitiesState.initial());
    return;
  }
}
