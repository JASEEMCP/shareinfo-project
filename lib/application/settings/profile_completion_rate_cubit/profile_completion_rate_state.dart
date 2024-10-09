part of 'profile_completion_rate_cubit.dart';

@freezed
class ProfileCompletionRateState with _$ProfileCompletionRateState {
  const factory ProfileCompletionRateState.initial() = _Initial;

  const factory ProfileCompletionRateState.loading() = _ResettingPassword;
  const factory ProfileCompletionRateState.error() = _Error;
  const factory ProfileCompletionRateState.success(int percentage) = _Success;
}
