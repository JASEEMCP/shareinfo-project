import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'registered_event_state.dart';
part 'registered_event_cubit.freezed.dart';

@lazySingleton
class RegisteredEventCubit extends Cubit<RegisteredEventState> {
  final HappeningService _happeningService;
  RegisteredEventCubit(this._happeningService)
      : super(const RegisteredEventState.initial());

  List<HappeningModel> model = [];

  ///Get Upcoming Events
  Future<void> getRegisteredEvent() async {
    if (model.isNotEmpty) return;
    emit(const RegisteredEventState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'registered');
    result.fold(
      (error) => emit(RegisteredEventState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const RegisteredEventState.empty());
        }
        emit(RegisteredEventState.success(model));
      },
    );
  }

  ///Refresh
  Future<void> refreshRegisteredEvent() async {
    emit(const RegisteredEventState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'registered');
    result.fold(
      (error) => emit(RegisteredEventState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const RegisteredEventState.empty());
        }
        emit(RegisteredEventState.success(model));
      },
    );
  }
}
