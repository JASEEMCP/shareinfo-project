part of 'happening_detail_cubit.dart';

@freezed
class HappeningDetailState with _$HappeningDetailState {
  const factory HappeningDetailState.initial() = _Initial;

  const factory HappeningDetailState.loading() = _Loading;
  const factory HappeningDetailState.error(MainFailure e) = _Error;
  const factory HappeningDetailState.success(HappeningModel model) = _Success;
}

extension HappeningDetailStateX on HappeningDetailState {
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;
}
