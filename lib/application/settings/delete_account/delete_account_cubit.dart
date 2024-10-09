import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/domain/profile/service/settings_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'delete_account_state.dart';
part 'delete_account_cubit.freezed.dart';

@lazySingleton
class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final SettingsService _settingsService;
  DeleteAccountCubit(this._settingsService)
      : super(const DeleteAccountState.initial());

  //Delete account
  Future<void> deleteAccount(DeleteAccountModel model) async {
    emit(const DeleteAccountState.isSubmitting());
    //await supabase.deleteUserInfo();
    final result = await _settingsService.deleteAccount(model);
    result.fold(
      (failure) => emit(DeleteAccountState.submissionError(failure)),
      //Emit state is success
      (success) {
        //Clear app data
        tokenCubit.clearAppData();
        emit(const DeleteAccountState.submitted());
      },
    );
  }
}

class DeleteAccountModel {
  final String? reason;
  final String? password;
  final String? refreshToken;
  DeleteAccountModel({this.reason, this.password, this.refreshToken});
}
