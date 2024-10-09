import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

abstract class ForgotPasswordService {
  Future<Either<AuthException, String>> sendOtp(String email);
  Future<Either<AuthException, String>> verifyOtp(String email, String otp);
  Future<Either<AuthException, String>> resetPassword(
      String email, String password);
}
