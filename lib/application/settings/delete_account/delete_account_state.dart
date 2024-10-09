part of 'delete_account_cubit.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.isSubmitting() = _IsSubmitting;
  const factory DeleteAccountState.submissionError(AuthException e) =
      _SubmissionError;
  const factory DeleteAccountState.submitted() = _Submitted;
}

extension DeleteAccountStateX on DeleteAccountState {
  bool get isSubmitting => this is _IsSubmitting;
  bool get isSubmitted => this is _Submitted;
  bool get isError => this is _SubmissionError;
}
