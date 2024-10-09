part of 'happening_list_cubit.dart';

@freezed
class HappeningListState with _$HappeningListState {
  const factory HappeningListState.initial() = _Initial;

  const factory HappeningListState.loading() = _Loading;
  const factory HappeningListState.error(MainFailure e) = _Error;
  const factory HappeningListState.empty() = _Empty;
  const factory HappeningListState.success(List<HappeningModel> model) =
      _Success;

  const factory HappeningListState.searching() = _Searching;
  const factory HappeningListState.searchFail(MainFailure e) = _SearchFail;
  const factory HappeningListState.notFound() = _NotFound;
  const factory HappeningListState.found(List<HappeningModel> model) = _Found;
}
