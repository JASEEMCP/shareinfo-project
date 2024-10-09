import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/auth/model/token_model.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';

abstract class AuthService {
  Future<Either<AuthException, Token>> login(String email, String password);
  Future<Either<AuthException, Token>> refresh(String refreshToken);
  Future<Either<AuthException, String>> logout(String refreshToken);

  Future<Either<AuthException, String>> signUp(
    String email,
    String phoneNumber,
    String firstName,
  );
  Future<Either<AuthException, String>> otpVerify(String otp);
  Future<Either<AuthException, Token>> createPassword(String password);
}
