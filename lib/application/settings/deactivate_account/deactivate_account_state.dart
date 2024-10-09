part of 'deactivate_account_cubit.dart';

@freezed
class DeactivateAccountState with _$DeactivateAccountState {
  const factory DeactivateAccountState.initial() = _Initial;
  const factory DeactivateAccountState.isSubmitting() = _IsSubmitting;
  const factory DeactivateAccountState.submissionError(AuthException e) =
      _SubmissionError;
  const factory DeactivateAccountState.submitted() = _Submitted;
}

extension DeactivateAccountStateX on DeactivateAccountState {
  bool get isSubmitting => this is _IsSubmitting;
  bool get isSubmitted => this is _Submitted;
  bool get isError => this is _SubmissionError;
}
