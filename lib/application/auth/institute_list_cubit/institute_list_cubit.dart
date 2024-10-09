import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/auth/model/institute_list_model/institute_list_model/institute_list_model.dart';
import 'package:shareinfo/domain/auth/service/pre_profile_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

part 'institute_list_state.dart';
part 'institute_list_cubit.freezed.dart';

@injectable
class InstituteListCubit extends Cubit<InstituteListState> {
  final PreProfileService _preProfileService;
  InstituteListCubit(this._preProfileService)
      : super(const InstituteListState.initial());

  Future<void> getInstituteList() async {
    emit(const InstituteListState.fetchingInstituteList());
    final result = await _preProfileService.getInstituteList();
    result.fold(
      ///Emitting auth exception
      (authError) => emit(InstituteListState.error(authError)),

      ///Emit success state with list of institute data
      (instituteList) {
        emit(InstituteListState.fetchingSuccess(instituteList));
      },
    );
  }

  ///Search institute
  Future<void> searchInstituteList(String institute) async {
    emit(const InstituteListState.fetchingInstituteList());
    final result = await _preProfileService.searchInstitute(institute);
    result.fold(

        ///Emitting auth exception
        (authError) => emit(InstituteListState.error(authError)),

        ///Emit success state with list of institute data
        (instituteList) {
      if (instituteList.isEmpty) {
        emit(const InstituteListState.notFound());
        return;
      }
      emit(InstituteListState.fetchingSuccess(instituteList));
    });
  }
}
