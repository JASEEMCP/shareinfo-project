import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/profile/service/settings_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

part 'profile_completion_rate_state.dart';

part 'profile_completion_rate_cubit.freezed.dart';

@injectable
class ProfileCompletionRateCubit extends Cubit<ProfileCompletionRateState> {
  final SettingsService _settingsService;
  ProfileCompletionRateCubit(this._settingsService)
      : super(const ProfileCompletionRateState.initial());

  //Resetting password
  Future<void> getPercentage() async {
    emit(const ProfileCompletionRateState.loading());
    final result = await _settingsService.getProfileCompletionPercentage();
    result.fold(
      (failure) => emit(const ProfileCompletionRateState.error()),
      //Emit state is success
      (percentage) => emit(ProfileCompletionRateState.success(percentage)),
    );
  }
}
