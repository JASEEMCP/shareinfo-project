import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/auth/model/token_model.dart';
import 'package:shareinfo/domain/profile/model/candidate_profile_model/candidate_profile_model.dart';
import 'package:shareinfo/domain/profile/model/expected_salary_model/expected_salary_model.dart';
import 'package:shareinfo/domain/profile/model/personal_info_model/personal_info_model.dart';
import 'package:shareinfo/domain/profile/model/personal_info_model/pincode_model/post_office.dart';
import 'package:shareinfo/domain/profile/model/profile_model/profile_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/summary_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';

@LazySingleton(as: ProfileService)
class ProfileRepo extends ProfileService {
  @override
  Future<Either<MainFailure, ProfileModel>> getProfileInfo() async {
    try {
      final response =
          await dioClient.dio.get('${Env().apiBaseUrl}${ApiEndPoints.profile}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(ProfileModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  ///Getting candidate  info
  @override
  Future<Either<MainFailure, CandidateProfileModel>>
      getCandidateProfileInfo() async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.myProfile}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(CandidateProfileModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  ///Uploading profile picture and save candidate info into database
  @override
  Future<Either<MainFailure, Token>> updateCandidateProfile(
      CandidateProfileModel model) async {
    try {
      final response = await dioClient.dio.put(
        '${Env().apiBaseUrl}${ApiEndPoints.myProfile}',
        data: model.toJson(),
      );
      if (response.statusCode == RespCode.SUCCESS) {
        return Right(Token.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  ///Retrieving personal info of user
  @override
  Future<Either<MainFailure, PersonalInfoModel>> getPersonalInfo() async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.personalInfo}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(PersonalInfoModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

//Getting summary
  @override
  Future<Either<MainFailure, SummaryModel>> getSummary() async {
    try {
      final response =
          await dioClient.dio.get('${Env().apiBaseUrl}${ApiEndPoints.summary}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(SummaryModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

//Update profile info
  @override
  Future<Either<MainFailure, String>> updateProfileInfo(
      PersonalInfoModel model) async {
    try {
      final response = await dioClient.dio.put(
        '${Env().apiBaseUrl}${ApiEndPoints.personalInfo}',
        data: model.toJson(),
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

//Summary update
  @override
  Future<Either<MainFailure, String>> updateSummary(SummaryModel model) async {
    try {
      final response = await dioClient.dio.put(
        '${Env().apiBaseUrl}${ApiEndPoints.summary}',
        data: model.toJson(),
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, List<PostOffice>>> getPincodeAddress(
      int pincode) async {
    try {
      final response =
          await Dio().get('${ApiEndPoints.pincodeAddress}$pincode');
      List<PostOffice> postOfficeList = [];
      if (response.statusCode == RespCode.SUCCESS &&
          response.data[0]['PostOffice'] != null) {
        postOfficeList = (response.data[0]['PostOffice'] as List).map(
          (e) {
            return PostOffice.fromJson(e);
          },
        ).toList();

        return Right(postOfficeList);
      } else {
        ///if postal not in record return
        /// client error
        return const Left(MainFailure.clientError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.serverError());
      }
    }
  }

  @override
  Future<Either<MainFailure, ExpectedSalaryModel>> getExpectedSalary() async {
    try {
      final response = await dioClient.dio
          .get('${Env().apiBaseUrl}${ApiEndPoints.expectedSalary}');

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(ExpectedSalaryModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }

  @override
  Future<Either<MainFailure, String>> updateExpectedSalary(
      ExpectedSalaryModel model) async {
    try {
      final response = await dioClient.dio.put(
        '${Env().apiBaseUrl}${ApiEndPoints.expectedSalary}',
        data: model.toJson(),
      );

      if (response.statusCode == RespCode.SUCCESS) {
        return Right(response.data.toString());
      } else {
        return const Left(MainFailure.serverError());
      }
    } on DioException catch (exception) {
      //Checking exception is socket exception
      if (exception.error is SocketException) {
        return const Left(MainFailure.noInternet());
      } else {
        return const Left(MainFailure.clientError());
      }
    }
  }
}
