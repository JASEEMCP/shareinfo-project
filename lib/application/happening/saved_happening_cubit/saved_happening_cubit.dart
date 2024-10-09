import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

part 'saved_happening_state.dart';
part 'saved_happening_cubit.freezed.dart';

@lazySingleton
class SavedHappeningCubit extends Cubit<SavedHappeningState> {
  final HappeningService _happeningService;
  SavedHappeningCubit(this._happeningService)
      : super(const SavedHappeningState.initial());
  List<HappeningModel> model = [];

  ///Get Upcoming Events
  Future<void> getSavedEvent() async {
    emit(const SavedHappeningState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'saved');
    result.fold(
      (error) => emit(SavedHappeningState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const SavedHappeningState.empty());
        }
        emit(SavedHappeningState.success(model));
      },
    );
  }

  ///Refresh
  Future<void> refreshSavedEvent() async {
    emit(const SavedHappeningState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'saved');
    result.fold(
      (error) => emit(SavedHappeningState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const SavedHappeningState.empty());
        }
        emit(SavedHappeningState.success(model));
      },
    );
  }
}
