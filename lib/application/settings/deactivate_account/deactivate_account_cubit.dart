import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/domain/profile/service/settings_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'deactivate_account_state.dart';
part 'deactivate_account_cubit.freezed.dart';

@LazySingleton()
class DeactivateAccountCubit extends Cubit<DeactivateAccountState> {
  final SettingsService _settingsService;
  DeactivateAccountCubit(this._settingsService)
      : super(const DeactivateAccountState.initial());

  //Deactivating account
  Future<void> deactivateAccount(SubmissionData data) async {
    emit(const DeactivateAccountState.isSubmitting());
    final result = await _settingsService.deactivateAccount(data);
    result.fold(
      (failure) => emit(DeactivateAccountState.submissionError(failure)),
      //Emit state is success
      (success) {
        //Clear app data
        tokenCubit.clearAppData();
        emit(const DeactivateAccountState.submitted());
      },
    );
  }
}

//Store deactivation reason and data
class SubmissionData {
  final String? password;
  final String? reason;
  SubmissionData({this.password, this.reason});
}
