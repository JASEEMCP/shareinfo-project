part of 'suggested_list_cubit.dart';

@freezed
class SuggestedListState with _$SuggestedListState {
  const factory SuggestedListState.initial() = _Initial;
  const factory SuggestedListState.loading() = _Loading;
  const factory SuggestedListState.empty() = _Empty;
  const factory SuggestedListState.error(MainFailure e) = _Error;
  const factory SuggestedListState.success(List<JobCardModel> model) = _Success;
}
