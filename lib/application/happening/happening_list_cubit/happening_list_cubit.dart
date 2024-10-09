import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';
import 'package:shareinfo/domain/happening/happening_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'happening_list_state.dart';
part 'happening_list_cubit.freezed.dart';

@lazySingleton
class HappeningListCubit extends Cubit<HappeningListState> {
  final HappeningService _happeningService;
  HappeningListCubit(this._happeningService)
      : super(const HappeningListState.initial());
  List<HappeningModel> model = [];
  List<HappeningModel> searchList = [];

  ///Get Upcoming Events
  Future<void> getUpcomingEvent() async {
    if (model.isNotEmpty) return;
    emit(const HappeningListState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'upcoming');
    result.fold(
      (error) => emit(HappeningListState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const HappeningListState.empty());
        }
        emit(HappeningListState.success(model));
      },
    );
  }

  ///Refresh
  Future<void> refreshUpcomingEvent() async {
    emit(const HappeningListState.loading());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(null, 'upcoming');
    result.fold(
      (error) => emit(HappeningListState.error(error)),
      (success) {
        model = success;
        if (model.isEmpty) {
          return emit(const HappeningListState.empty());
        }
        emit(HappeningListState.success(model));
      },
    );
  }

  /// Search event
  Future<void> searchEvent(String query) async {
    if (query.isEmpty) {
      return emit(const HappeningListState.initial());
    }
    emit(const HappeningListState.searching());

    /// Get upcoming events with corresponding end point
    final result = await _happeningService.getHappeningList(query, 'all');
    result.fold(
      (error) => emit(HappeningListState.searchFail(error)),
      (success) {
        searchList = success;
        if (searchList.isEmpty) {
          return emit(const HappeningListState.notFound());
        }
        emit(HappeningListState.found(searchList));
      },
    );
  }

  //Clear data
  void clearData() {
    if (model.isNotEmpty) {
      return emit(HappeningListState.success(model));
    }
    model = [];
    searchList = [];
    emit(const HappeningListState.empty());
  }

  //Clear data
  void initializeSearch() {
    emit(const HappeningListState.initial());
  }
}
