part of 'leaderboards_list_cubit.dart';

@freezed
class LeaderboardsListState with _$LeaderboardsListState {
  const factory LeaderboardsListState.initial() = _Initial;

  const factory LeaderboardsListState.loading() = _Loading;

  const factory LeaderboardsListState.error(MainFailure e) = _Error;

  const factory LeaderboardsListState.success(LeaderboardsModel m) = _Success;
}
