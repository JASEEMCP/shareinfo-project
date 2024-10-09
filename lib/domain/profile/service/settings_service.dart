import 'package:dartz/dartz.dart';
import 'package:shareinfo/application/settings/deactivate_account/deactivate_account_cubit.dart';
import 'package:shareinfo/application/settings/delete_account/delete_account_cubit.dart';
import 'package:shareinfo/domain/auth/model/personal_information_model/personal_information_model.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

abstract class SettingsService {
  Future<Either<AuthException, String>> resetPassword(
      String oldPassword, String newPassword);

  Future<Either<AuthException, PersonalInformationModel>>
      getPersonalInformation();

  Future<Either<AuthException, String>> deactivateAccount(SubmissionData data);
  Future<Either<AuthException, String>> deleteAccount(DeleteAccountModel model);
  Future<Either<AuthException, int>> getProfileCompletionPercentage();
}
