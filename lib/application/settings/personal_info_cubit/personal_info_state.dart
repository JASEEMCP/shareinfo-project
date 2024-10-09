part of 'personal_info_cubit.dart';

@freezed
class PersonalInfoSettingState with _$PersonalInfoSettingState {
  const factory PersonalInfoSettingState.initial() = _Initial;
  const factory PersonalInfoSettingState.loading() = _Loading;
  const factory PersonalInfoSettingState.error(AuthException e) = _Error;
  const factory PersonalInfoSettingState.success(
      PersonalInformationModel model) = _Success;
}
