import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'event_preview_state.dart';
part 'event_preview_cubit.freezed.dart';

@lazySingleton
class EventPreviewCubit extends Cubit<EventPreviewState> {
  final HappeningService _happeningService;
  EventPreviewCubit(this._happeningService)
      : super(const EventPreviewState.initial());

  ///Get Upcoming Events
  Future<void> getEventPreview(String eventId) async {
    emit(const EventPreviewState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningPreview(eventId);
    result.fold(
      (error) => emit(EventPreviewState.error(error)),
      (success) {
        emit(const EventPreviewState.initial());
        emit(EventPreviewState.success(success));
      },
    );
  }
}
