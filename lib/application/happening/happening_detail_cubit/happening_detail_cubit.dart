import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'happening_detail_state.dart';
part 'happening_detail_cubit.freezed.dart';

@lazySingleton
class HappeningDetailCubit extends Cubit<HappeningDetailState> {
  final HappeningService _happeningService;
  HappeningDetailCubit(this._happeningService)
      : super(const HappeningDetailState.initial());

  HappeningModel model = HappeningModel();

  ///Get Upcoming Events
  Future<void> getEventDetail(String eventId) async {
    emit(const HappeningDetailState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getEventDetail(eventId);
    result.fold(
      (error) => emit(HappeningDetailState.error(error)),
      (success) {
        model = success;
        emit(HappeningDetailState.success(model));
      },
    );
  }

  ///Get Upcoming Events
  Future<void> saveHappening(String eventId, bool isSaved) async {
    /// Get upcoming events with corresponding end point
    final result = await _happeningService.saveEvent(eventId, isSaved);
    result.fold(
      (error) => null,
      (success) {
        model.isSaved = !isSaved;
        emit(const HappeningDetailState.initial());
        emit(HappeningDetailState.success(model));
      },
    );
  }
}
