part of 'specific_practice_leaderboards_list_cubit.dart';

@freezed
class SpecificPracticeLeaderboardsListState with _$SpecificPracticeLeaderboardsListState {
  const factory SpecificPracticeLeaderboardsListState.initial() = _Initial;

  const factory SpecificPracticeLeaderboardsListState.loading() = _Loading;

  const factory SpecificPracticeLeaderboardsListState.error(MainFailure e) = _Error;

  const factory SpecificPracticeLeaderboardsListState.success(SpecificPracticeLeaderboards m) = _Success;
}
