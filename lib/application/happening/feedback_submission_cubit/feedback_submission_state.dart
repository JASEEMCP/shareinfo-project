part of 'feedback_submission_cubit.dart';

@freezed
class FeedbackSubmissionState with _$FeedbackSubmissionState {
  const factory FeedbackSubmissionState.initial() = _Initial;

  const factory FeedbackSubmissionState.sendingFeedback() = _SendingFeedback;
  const factory FeedbackSubmissionState.error(MainFailure e) = _Error;
  const factory FeedbackSubmissionState.feedbackSubmitted() =
      _FeedbackSubmitted;
}

extension FeedbackSubmissionStateX on FeedbackSubmissionState {
  bool get isSubmitted => this is _FeedbackSubmitted;
  bool get isSubmitting => this is _SendingFeedback;
}
