import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/auth/model/institute_data/institute_data.dart';
import 'package:shareinfo/domain/auth/service/pre_profile_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

part 'department_list_state.dart';
part 'department_list_cubit.freezed.dart';

@lazySingleton
class DepartmentListCubit extends Cubit<DepartmentListState> {
  final PreProfileService _preProfileService;
  DepartmentListCubit(this._preProfileService)
      : super(const DepartmentListState.initial());

  //Get department list
  Future<void> getDepartmentList(int id) async {
    emit(const DepartmentListState.fetchingDepartmentList());
    final result = await _preProfileService.getDepartmentList(id);
    result.fold(
      ///Emitting auth exception
      (authError) => emit(DepartmentListState.error(authError)),

      ///Emit success state with list of dept data
      (deptList) {
        emit(DepartmentListState.successToLoad(deptList));
      },
    );
  }
}
