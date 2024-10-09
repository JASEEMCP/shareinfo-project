import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/profile/model/volunteering_exp_model/volunteering_exp_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_3.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'volunteering_experience_state.dart';
part 'volunteering_experience_cubit.freezed.dart';

@lazySingleton
class VolunteeringExperienceCubit extends Cubit<VolunteeringExperienceState> {
  final ProfileManageService2 _profileManageService2;
  VolunteeringExperienceCubit(this._profileManageService2)
      : super(VolunteeringExperienceState.initial());

  VolunteeringExpModel model = VolunteeringExpModel();

  Future<void> getVolunteeringExpInfo(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService2.getVolunteeringExp(id);
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
            userModel: model,
          ),
        );
      },
    );
  }

  Future<void> saveProfessionalExam(
    VolunteeringExpModel temp,
    DioMethodType type,
  ) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userModel: model, saveSuccess: false));

    final result =
        await _profileManageService2.updateVolunteeringExp(model, type);
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isLoading: false,
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
            userModel: model,
          ),
        );
      },
    );
  }

//Delete profile data
  Future<void> deleteVolunteeringExpInfo() async {
    emit(state.copyWith(saveSuccess: false));
    //Deleting data
    final result = await _profileManageService2.updateVolunteeringExp(
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
    model = VolunteeringExpModel();
    emit(VolunteeringExperienceState.initial());
    return;
  }
}
