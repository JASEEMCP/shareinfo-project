part of 'institute_list_cubit.dart';

@freezed
class InstituteListState with _$InstituteListState {
  const factory InstituteListState.initial() = _Initial;
  const factory InstituteListState.fetchingInstituteList() =
      _FetchingInstituteList;
  const factory InstituteListState.fetchingSuccess(
      List<InstituteListModel> item) = _FetchingSuccess;
  const factory InstituteListState.error(AuthException e) = _Error;
  const factory InstituteListState.notFound() = _NotFound;

  const factory InstituteListState.fetchingDepartmentList() =
      _FetchingDepartmentList;
  const factory InstituteListState.successToLoad(List<String> item) =
      _SuccessToLoad;
}

extension InstituteListStateX on InstituteListState {
  bool get isLoading => this is _FetchingDepartmentList;
  bool get isError => this is _Error;
  bool get isSuccess => this is _SuccessToLoad;
}
