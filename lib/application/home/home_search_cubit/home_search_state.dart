part of 'home_search_cubit.dart';

@freezed
class HomeSearchState with _$HomeSearchState {
  const factory HomeSearchState.initial() = _Initial;
  const factory HomeSearchState.loading() = _Loading;
  const factory HomeSearchState.empty() = _Empty;
  const factory HomeSearchState.error(MainFailure e) = _Error;
  const factory HomeSearchState.success(List<JobCardModel> model) = _Success;
}
