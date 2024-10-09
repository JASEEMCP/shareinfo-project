part of 'department_list_cubit.dart';

@freezed
class DepartmentListState with _$DepartmentListState {
  const factory DepartmentListState.initial() = _Initial;

  const factory DepartmentListState.error(AuthException e) = _Error;

  const factory DepartmentListState.fetchingDepartmentList() =
      _FetchingDepartmentList;
  const factory DepartmentListState.successToLoad(InstituteData item) =
      _SuccessToLoad;
}

extension DepartmentListStateX on DepartmentListState {
  bool get isLoading => this is _FetchingDepartmentList;
  bool get isError => this is _Error;
}
