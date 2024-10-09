import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'event_occurred_state.dart';
part 'event_occurred_cubit.freezed.dart';

@lazySingleton
class EventOccurredCubit extends Cubit<EventOccurredState> {
  final HappeningService _happeningService;
  EventOccurredCubit(this._happeningService)
      : super(const EventOccurredState.initial());

  List<HappeningModel> model = [];

  ///Get Upcoming Events
  Future<void> getOccurredEvent() async {
    if (model.isNotEmpty) return;
    emit(const EventOccurredState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'occurred');
    result.fold(
      (error) => emit(EventOccurredState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const EventOccurredState.empty());
        }
        emit(EventOccurredState.success(model));
      },
    );
  }

  ///Refresh
  Future<void> refreshOccurredEvent() async {
    emit(const EventOccurredState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'occurred');
    result.fold(
      (error) => emit(EventOccurredState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const EventOccurredState.empty());
        }
        emit(EventOccurredState.success(model));
      },
    );
  }
}
