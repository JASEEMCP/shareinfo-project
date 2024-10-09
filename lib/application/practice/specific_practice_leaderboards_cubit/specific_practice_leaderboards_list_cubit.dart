import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/practice/models/specific_practice_leaderboards/specific_practice_leaderboards.dart';
import 'package:shareinfo/domain/practice/services/leaderboards_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'specific_practice_leaderboards_list_state.dart';
part 'specific_practice_leaderboards_list_cubit.freezed.dart';


@lazySingleton
class SpecificPracticeLeaderboardsListCubit extends Cubit<SpecificPracticeLeaderboardsListState> {

  final LeaderboardsService _leaderboardsService;
  SpecificPracticeLeaderboardsListCubit(this._leaderboardsService) : super(const SpecificPracticeLeaderboardsListState.initial());


  Future<void> getSpecificPracticeLeaderboards(String id) async {
    emit(const SpecificPracticeLeaderboardsListState.loading());

    final r = await _leaderboardsService.getSpecificPracticeLeaderboards(id);

    r.fold(
      (e) => emit(SpecificPracticeLeaderboardsListState.error(e)),
      (item) {
        emit(SpecificPracticeLeaderboardsListState.success(item));
      },
    );
  }
}
