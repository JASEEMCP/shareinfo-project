import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/expected_salary_model/expected_salary_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service.dart';

part 'expected_salary_state.dart';
part 'expected_salary_cubit.freezed.dart';

@lazySingleton
class ExpectedSalaryCubit extends Cubit<ExpectedSalaryState> {
  final ProfileService _profileService;
  ExpectedSalaryCubit(this._profileService)
      : super(ExpectedSalaryState.initial());

  ExpectedSalaryModel model = ExpectedSalaryModel();

  Future<void> getExpectedSalary() async {
    emit(state.copyWith(isLoading: true, userModel: model, saveSuccess: false));

    final result = await _profileService.getExpectedSalary();
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

  Future<void> saveExpectedSalary(ExpectedSalaryModel temp) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userModel: model, saveSuccess: false));

    final result = await _profileService.updateExpectedSalary(model);
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

  ///replace every data into null
  void clearData() {
    model = ExpectedSalaryModel();
    emit(ExpectedSalaryState.initial());
    return;
  }
}
