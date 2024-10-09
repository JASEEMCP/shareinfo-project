part of 'certificate_cubit.dart';

@freezed
class CertificateState with _$CertificateState {
  const factory CertificateState({
    required bool isLoading,
    required CertificateModel userModel,
    required bool isSaving,
    required bool isError,
    required MainFailure? error,
    required bool isSuccess,
    required bool saveSuccess,
    required bool deleteSuccess,
  }) = _EducationState;

  factory CertificateState.initial() {
    return CertificateState(
      deleteSuccess: false,
      isLoading: false,
      userModel: CertificateModel(),
      isSaving: false,
      isError: false,
      error: null,
      isSuccess: false,
      saveSuccess: false,
    );
  }
}
