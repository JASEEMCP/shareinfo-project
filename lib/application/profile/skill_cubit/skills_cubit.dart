import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/profile/model/profile_model/skill_set.dart';
import 'package:shareinfo/domain/profile/service/profile_service_5.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'skills_state.dart';
part 'skills_cubit.freezed.dart';

@lazySingleton
class SkillsCubit extends Cubit<SkillsState> {
  final ProfileManageService4 _profileManageService4;
  SkillsCubit(this._profileManageService4) : super(SkillsState.initial());
  List<SkillSet> model = [];
  List<SkillSet> searchList = [];

  Future<void> getSkillList() async {
    emit(state.copyWith(isLoading: true, userModel: model, searchList: []));

    final result = await _profileManageService4.getSkills();
    result.fold(
      (error) {
        emit(
          state.copyWith(
            error: error,
            isError: true,
            isLoading: false,
            searchList: [],
          ),
        );
      },
      (userData) {
        model = userData;
        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            userModel: model,
            searchList: [],
          ),
        );
        return model;
      },
    );
  }

  Future<void> searchSkill(String query) async {
    emit(state.copyWith(isLoading: true));

    final result = await _profileManageService4.searchSkill(query);
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
            searchSuccess: true,
            searchList: model,
          ),
        );
      },
    );
  }

  Future<void> addNewSkill(
    int id,
  ) async {
    emit(state.copyWith(userModel: model));

    final result = await _profileManageService4.addSkill(id, DioMethodType.put);
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isLoading: false,
          isError: true,
        ),
      ),
      (_) async {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            userModel: model,
          ),
        );
        await refreshScreen();
      },
    );
  }

//Delete profile data
  Future<void> deleteSkill(int id) async {
    //Deleting data
    final result = await _profileManageService4.addSkill(
      id,
      DioMethodType.delete,
    );
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isLoading: false,
          deleteSuccess: false,
        ),
      ),
      (_) async {
        await refreshScreen();
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            deleteSuccess: true,
            userModel: model,
          ),
        );
      },
    );
  }

  Future<void> refreshScreen() async {
    emit(state.copyWith(userModel: model, searchList: []));

    final result = await _profileManageService4.getSkills();
    result.fold(
      (error) {
        emit(
          state.copyWith(
            error: error,
            searchSuccess: false,
            isError: true,
            isLoading: false,
            searchList: [],
          ),
        );
      },
      (userData) {
        model = userData;
        emit(
          state.copyWith(
            searchSuccess: false,
            isError: false,
            isLoading: false,
            isSuccess: true,
            userModel: model,
            searchList: [],
          ),
        );
      },
    );
  }

  ///replace every data into null
  void clearData() {
    model = [];
    searchList = [];
    emit(SkillsState.initial());
    return;
  }
}
