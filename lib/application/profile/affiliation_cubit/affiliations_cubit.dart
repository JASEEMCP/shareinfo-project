import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/profile/model/affiliations_model/affiliations_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_4.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'affiliations_state.dart';
part 'affiliations_cubit.freezed.dart';

@lazySingleton
class AffiliationsCubit extends Cubit<AffiliationsState> {
  final ProfileManageService3 _profileManageService3;

  AffiliationsCubit(this._profileManageService3)
      : super(AffiliationsState.initial());
  AffiliationsModel model = AffiliationsModel();

  Future<void> retrieveAffiliations(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService3.getAffiliation(id);
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
      },
    );
  }

  Future<void> saveAffiliation(
      AffiliationsModel temp, DioMethodType type) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService3.updateAffiliation(model, type);
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
  Future<void> deleteAffiliation() async {
    emit(state.copyWith(saveSuccess: false));
    //Deleting data
    final result = await _profileManageService3.updateAffiliation(
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
    model = AffiliationsModel();
    emit(AffiliationsState.initial());
    return;
  }
}
