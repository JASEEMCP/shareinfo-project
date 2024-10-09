import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/auth/model/aspirational_list_model/aspirational_list_model.dart';
import 'package:shareinfo/domain/auth/service/pre_profile_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

part 'aspiration_list_state.dart';
part 'aspiration_list_cubit.freezed.dart';

@injectable
class AspirationListCubit extends Cubit<AspirationListState> {
  final PreProfileService _preProfileService;
  AspirationListCubit(this._preProfileService)
      : super(const AspirationListState.initial());
  List<AspirationalListModel> items = [];
  Future<void> getAspirationalFields() async {
    if (items.isNotEmpty) return;
    emit(const AspirationListState.fetchingAspirationField());
    final result = await _preProfileService.getAspirationField();
    result.fold(
      ///Emitting auth exception
      (authError) => emit(AspirationListState.error(authError)),

      ///Emit success state with list of aspirational data
      (aspirationList) {
        items = aspirationList;
        emit(AspirationListState.fetchingSuccess(items));
      },
    );
  }

  ///Search institute
  Future<void> searchAspiration(String query) async {
    emit(const AspirationListState.fetchingAspirationField());

    final result = await _preProfileService.searchAspiration(query);

    result.fold(
      ///Emitting auth exception
      (authError) => emit(AspirationListState.error(authError)),

      ///Emit success state with list of institute data
      (instituteList) {
        if (instituteList.isEmpty) {
          emit(const AspirationListState.notFound());
          return;
        }
        emit(AspirationListState.fetchingSuccess(instituteList));
      },
    );
  }
}
