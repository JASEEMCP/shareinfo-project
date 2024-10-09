import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/academic_info_model/academic_info_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_5.dart';

part 'academic_info_state.dart';
part 'academic_info_cubit.freezed.dart';

@lazySingleton
class AcademicInfoCubit extends Cubit<AcademicInfoState> {
  final ProfileManageService4 _profileManageService4;
  AcademicInfoCubit(this._profileManageService4)
      : super(AcademicInfoState.initial());
  AcademicInfoModel model = AcademicInfoModel();

  Future<void> getAcademicInfo() async {
    emit(state.copyWith(isLoading: true, userData: model, saveSuccess: false));

    final result =
        await _profileManageService4.getAcademicInfo(null, DioMethodType.get);
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isLoading: false,
        ),
      ),
      (userData) {
        model = userData;
        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            userData: model,
          ),
        );
      },
    );
  }

  Future<void> saveAcademicInfo(AcademicInfoModel temp) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userData: model, saveSuccess: false));

    final result =
        await _profileManageService4.getAcademicInfo(model, DioMethodType.put);
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isSaving: false,
          saveSuccess: false,
        ),
      ),
      (_) {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isSaving: false,
            isError: false,
            saveSuccess: true,
            userData: model,
          ),
        );
      },
    );
  }

  ///replace every data into null
  void clearData() {
    model = AcademicInfoModel();
    emit(AcademicInfoState.initial());
    return;
  }
}
