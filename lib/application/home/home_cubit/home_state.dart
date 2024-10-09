part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.initialLoading() = _InitialLoading;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.empty() = _Empty;
  const factory HomeState.error(MainFailure e) = _Error;
  const factory HomeState.suggestionEmpty() = _SuggestionEmpty;
  const factory HomeState.suggestionError(MainFailure e) = _SuggestionError;
  const factory HomeState.success(List<JobCardModel> model) = _Success;
  const factory HomeState.initialSuccess(HomeJobModel model) = _InitialSuccess;
}

extension HomeStateX on HomeState {
  bool get isSuggestionLoading => this is _Loading;
  bool get isSuggestionEmpty => this is _SuggestionEmpty;
  bool get isSuggestionError => this is _SuggestionError;
}
