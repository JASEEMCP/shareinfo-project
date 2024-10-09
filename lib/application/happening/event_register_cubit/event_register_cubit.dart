import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/application/happening/happening_detail_cubit/happening_detail_cubit.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'event_register_state.dart';
part 'event_register_cubit.freezed.dart';

@lazySingleton
class EventRegisterCubit extends Cubit<EventRegisterState> {
  final HappeningService _happeningService;
  EventRegisterCubit(this._happeningService)
      : super(const EventRegisterState.initial());

  ///Get Upcoming Events
  Future<void> registerEvent(String eventId) async {
    emit(const EventRegisterState.registering());

    /// Register event
    final result = await _happeningService.registerHappening(eventId);
    result.fold(
      (error) => emit(EventRegisterState.error(error)),
      (success) {
        /// Rebuilding event detail cubit
        getIt<HappeningDetailCubit>().getEventDetail(eventId);
        emit(const EventRegisterState.success());
      },
    );
  }
}
