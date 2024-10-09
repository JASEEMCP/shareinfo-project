import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/common/file_picker_cubit/file_picker_cubit.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/common/azure_storage_util.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/profile_model/cv_resume_set.dart';
import 'package:shareinfo/domain/profile/service/profile_service_2.dart';

part 'cv_resume_state.dart';
part 'cv_resume_cubit.freezed.dart';

@LazySingleton()
class CvResumeCubit extends Cubit<CvResumeState> {
  final ProfileManageService _profileService2;
  final FilePickerCubit _filePickerCubit;
  final AzureStorageService _azureStorageService;
  CvResumeCubit(
      this._profileService2, this._filePickerCubit, this._azureStorageService)
      : super(CvResumeState.initial());

  CvResumeSet model = CvResumeSet();

//Get one specific resume
  Future<void> retrieveCvResume(int id) async {
    emit(state.copyWith(
      isLoading: true,
      cvInfo: model,
      saveSuccess: false,
    ));
    final result = await _profileService2.getResumeData(id);
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
            cvInfo: model,
          ),
        );
        // Load file is exist
        await _filePickerCubit.loadFile(model.mediaName, model.cv);
      },
    );
  }

//Delete profile data and resume
  Future<void> deleteCvResume(String? path) async {
    emit(state.copyWith(saveSuccess: false));

    //Deleting data in storage
    final uploadResp = await _azureStorageService.deleteDocument(
      BlobDir.cvResume,
      path!.split('/').last,
    );

    //Check response is success or not
    if (uploadResp.isLeft()) return;

    // Update DB
    final result = await _profileService2.updateResume(
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
        /// Refreshing profile screen
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

  void clearData() {
    model = CvResumeSet();
    emit(CvResumeState.initial());
  }
}
