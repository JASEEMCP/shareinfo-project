part of 'expected_salary_cubit.dart';

@freezed
class ExpectedSalaryState with _$ExpectedSalaryState {
  const factory ExpectedSalaryState({
    required bool isLoading,
    required ExpectedSalaryModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
  }) = _ExpectedSalaryState;

  factory ExpectedSalaryState.initial() {
    return ExpectedSalaryState(
      isLoading: false,
      userModel: ExpectedSalaryModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
