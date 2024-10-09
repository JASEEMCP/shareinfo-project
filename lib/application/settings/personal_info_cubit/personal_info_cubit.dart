import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/auth/model/personal_information_model/personal_information_model.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/domain/profile/service/settings_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'personal_info_state.dart';
part 'personal_info_cubit.freezed.dart';

@lazySingleton
class PersonalInfoSettingCubit extends Cubit<PersonalInfoSettingState> {
  final SettingsService _settingsService;
  PersonalInfoSettingCubit(this._settingsService)
      : super(const PersonalInfoSettingState.initial());

  ///Get applied jobs detail data
  Future<void> getPersonalInfo() async {
    emit(const PersonalInfoSettingState.loading());
    final result = await _settingsService.getPersonalInformation();
    result.fold(
      (error) => emit(PersonalInfoSettingState.error(error)),
      (success) {
        emit(PersonalInfoSettingState.success(success));
      },
    );
  }
}
