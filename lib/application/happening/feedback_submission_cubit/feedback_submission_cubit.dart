import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'feedback_submission_state.dart';
part 'feedback_submission_cubit.freezed.dart';

@lazySingleton
class FeedbackSubmissionCubit extends Cubit<FeedbackSubmissionState> {
  final HappeningService _happeningService;
  FeedbackSubmissionCubit(this._happeningService)
      : super(const FeedbackSubmissionState.initial());

  ///Get Upcoming Events
  Future<void> submitFeedback(
      String eventId, String feedbackText, int rate) async {
    emit(const FeedbackSubmissionState.sendingFeedback());

    /// Get upcoming events with corresponding end point
    final result =
        await _happeningService.sentFeedBack(eventId, rate, feedbackText);
    result.fold(
      (error) => emit(FeedbackSubmissionState.error(error)),
      (_) {
        emit(const FeedbackSubmissionState.feedbackSubmitted());
      },
    );
  }
}
