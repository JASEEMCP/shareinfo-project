import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/auth/model/token_model.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/candidate_profile_model/candidate_profile_model.dart';
import 'package:shareinfo/domain/profile/model/expected_salary_model/expected_salary_model.dart';
import 'package:shareinfo/domain/profile/model/personal_info_model/personal_info_model.dart';
import 'package:shareinfo/domain/profile/model/personal_info_model/pincode_model/post_office.dart';
import 'package:shareinfo/domain/profile/model/profile_model/profile_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/summary_model.dart';

abstract class ProfileService {
  Future<Either<MainFailure, List<PostOffice>>> getPincodeAddress(int pincode);
  Future<Either<MainFailure, ProfileModel>> getProfileInfo();
  Future<Either<MainFailure, CandidateProfileModel>> getCandidateProfileInfo();
  Future<Either<MainFailure, Token>> updateCandidateProfile(
      CandidateProfileModel model);
  Future<Either<MainFailure, PersonalInfoModel>> getPersonalInfo();
  Future<Either<MainFailure, String>> updateProfileInfo(
      PersonalInfoModel model);
  Future<Either<MainFailure, SummaryModel>> getSummary();
  Future<Either<MainFailure, String>> updateSummary(SummaryModel model);
  Future<Either<MainFailure, ExpectedSalaryModel>> getExpectedSalary();
  Future<Either<MainFailure, String>> updateExpectedSalary(
      ExpectedSalaryModel model);
}
