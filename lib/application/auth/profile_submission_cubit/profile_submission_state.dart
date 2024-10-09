part of 'profile_submission_cubit.dart';

@freezed
class ProfileSubmissionState with _$ProfileSubmissionState {
  const factory ProfileSubmissionState.initial() = _Initial;
  const factory ProfileSubmissionState.isSubmitting() = _IsSubmitting;
  const factory ProfileSubmissionState.submissionError(AuthException e) =
      _SubmissionError;
  const factory ProfileSubmissionState.profileCreated() = _ProfileCreated;
}

extension ProfileSubmissionStateX on ProfileSubmissionState {
  bool get isSubmitting => this is _IsSubmitting;
  bool get isSubmitted => this is _ProfileCreated;
  bool get isError => this is _SubmissionError;
}
