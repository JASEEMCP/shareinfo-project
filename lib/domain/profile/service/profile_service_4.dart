import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/affiliations_model/affiliations_model.dart';
import 'package:shareinfo/domain/profile/model/organization_activity_model/organization_activity_model.dart';
import 'package:shareinfo/domain/profile/model/references_model/references_model.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/domain_list_model.dart';

abstract class ProfileManageService3 {
  Future<Either<MainFailure, OrganizationActivityModel>>
      getOrganizationActivities(int id);
  Future<Either<MainFailure, String>> updateOrganizationActivities(
    OrganizationActivityModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, AffiliationsModel>> getAffiliation(int id);
  Future<Either<MainFailure, String>> updateAffiliation(
    AffiliationsModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, ReferencesModel>> getReferences(int id);
  Future<Either<MainFailure, String>> updateReferences(
    ReferencesModel model,
    DioMethodType type,
  );

  Future<Either<MainFailure, List<DomainListModel>>> getDomainList();
}
