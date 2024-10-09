import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/domain/profile/service/settings_service.dart';

part 'reset_password_state.dart';
part 'reset_password_cubit.freezed.dart';

@lazySingleton
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SettingsService _settingsService;
  ResetPasswordCubit(this._settingsService)
      : super(const ResetPasswordState.initial());

  //Resetting password
  Future<void> resetPassword(String oldPassword, String newPassword) async {
    emit(const ResetPasswordState.resettingPassword());
    final result =
        await _settingsService.resetPassword(oldPassword, newPassword);
    result.fold(
      (failure) => emit(ResetPasswordState.error(failure)),
      //Emit state is success
      (success) => emit(const ResetPasswordState.success()),
    );
  }
}
