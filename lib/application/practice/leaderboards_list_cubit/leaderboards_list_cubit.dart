import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/practice/models/leaderboards_model/leaderboards_model.dart';
import 'package:shareinfo/domain/practice/services/leaderboards_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'leaderboards_list_state.dart';

part 'leaderboards_list_cubit.freezed.dart';

@lazySingleton
class LeaderboardsListCubit extends Cubit<LeaderboardsListState> {
  final LeaderboardsService _leaderboardsService;
  LeaderboardsListCubit(this._leaderboardsService)
      : super(const LeaderboardsListState.initial());


  Future<void> getLeaderboards(String type) async {
    emit(const LeaderboardsListState.loading());

    final r = await _leaderboardsService.getLeaderboards(type);

    r.fold(
      (e) => emit(LeaderboardsListState.error(e)),
      (item) {
        emit(LeaderboardsListState.success(item));
      },
    );
  }
}
