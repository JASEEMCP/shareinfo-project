import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/profile/model/profile_model/language_set.dart';
import 'package:shareinfo/domain/profile/service/profile_service_5.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'language_state.dart';
part 'language_cubit.freezed.dart';

@lazySingleton
class LanguageCubit extends Cubit<LanguageState> {
  final ProfileManageService4 _profileManageService4;
  LanguageCubit(this._profileManageService4) : super(LanguageState.initial());
  LanguageSet model = LanguageSet();

  Future<void> getLanguageInfo(int id) async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService4.getLanguages(id);
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

  Future<void> addNewLanguage(
    LanguageSet temp,
    DioMethodType type,
  ) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userModel: model, saveSuccess: false));

    final result = await _profileManageService4.addLanguage(model, type);
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
            userModel: model,
          ),
        );
      },
    );
  }

  //Delete profile data
  Future<void> deleteLanguage() async {
    //Deleting data
    emit(state.copyWith(saveSuccess: false));
    final result = await _profileManageService4.addLanguage(
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
    model = LanguageSet();
    emit(LanguageState.initial());
    return;
  }
}
