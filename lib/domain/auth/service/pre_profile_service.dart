import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/auth/model/aspirational_list_model/aspirational_list_model.dart';
import 'package:shareinfo/domain/auth/model/institute_data/institute_data.dart';
import 'package:shareinfo/domain/auth/model/institute_list_model/institute_list_model/institute_list_model.dart';
import 'package:shareinfo/domain/auth/model/pre_profile_model/pre_profile_model.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

abstract class PreProfileService {
  Future<Either<AuthException, InstituteData>> getDepartmentList(
      int instituteId);
  Future<Either<AuthException, List<InstituteListModel>>> getInstituteList();
  Future<Either<AuthException, Map<String, dynamic>>> submitPreProfile(
      PreProfileModel model,
      {required bool isStudent});
  Future<Either<AuthException, List<InstituteListModel>>> searchInstitute(
      String searchQuery);

  Future<Either<AuthException, List<AspirationalListModel>>> searchAspiration(
      String searchQuery);
  Future<Either<AuthException, List<AspirationalListModel>>>
      getAspirationField();
}
