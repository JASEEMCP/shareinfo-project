part of 'aspiration_list_cubit.dart';

@freezed
class AspirationListState with _$AspirationListState {
  const factory AspirationListState.initial() = _Initial;
  const factory AspirationListState.fetchingAspirationField() =
      _FetchingAspirationField;
  const factory AspirationListState.fetchingSuccess(
      List<AspirationalListModel> item) = _FetchingSuccess;

  const factory AspirationListState.error(AuthException e) = _Error;

  const factory AspirationListState.notFound() = _NotFound;
}
