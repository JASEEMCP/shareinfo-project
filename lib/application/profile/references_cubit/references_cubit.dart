import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/profile/model/references_model/references_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service_4.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'references_state.dart';
part 'references_cubit.freezed.dart';

@lazySingleton
class ReferencesCubit extends Cubit<ReferencesState> {
  final ProfileManageService3 _profileManageService3;
  ReferencesCubit(this._profileManageService3)
      : super(ReferencesState.initial());

  ReferencesModel model = ReferencesModel();

  Future<void> getReferences(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService3.getReferences(id);
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

  Future<void> saveReferences(
    ReferencesModel temp,
    DioMethodType type,
  ) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userModel: model));

    final result = await _profileManageService3.updateReferences(model, type);
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
  Future<void> deleteReferencesInfo() async {
    emit(state.copyWith(saveSuccess: false));
    //Deleting data
    final result = await _profileManageService3.updateReferences(
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
    model = ReferencesModel();
    emit(ReferencesState.initial());
    return;
  }
}
