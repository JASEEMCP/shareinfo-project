import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/auth/service/auth_service.dart';
import 'package:shareinfo/domain/failures/auth_exception.dart';
import 'package:shareinfo/presentation/root_widget.dart';
import 'package:shareinfo/router/router_path.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;
  final TokenCubit _tokenCubit;
  LoginCubit(this._authService, this._tokenCubit)
      : super(const LoginState.initial());

  ///Store email address temporary
  ///This will use store local storage after completing create password completed
  ///this data is mainly used for generating supabase path if user type is [Student]
  String emailAddress = '';
  void login(String email, String password) async {
    /// state is loading
    emit(const LoginState.logging());
    //Checking if device is connected
    try {
      final token = await _authService.login(email, password);

      token.fold(
        ///Emit login is unsuccess
        (failure) {
          emit(LoginState.authError(failure));
        },
        (success) {
          _tokenCubit.setToken(success.copyWith(email: email));

          final isProfileCreated =
              auth.authInfo.value.isProfileCreated ?? false;

          ///Navigate to pre profile screen when user not completed profile submission
          if (!isProfileCreated) {
            emit(const LoginState.redirectToPreProfile());
            return;
          }

          // Updating sas token
          updatingSASToken();

          ///Emit state login is success
          emit(const LoginState.authorized());
        },
      );
    } catch (e) {
      return emit(const LoginState.authError(AuthException.noInternet()));
    }
  }

  ///Sign up user
  void signUp(String email, String phoneNumber, String firstName) async {
    emit(const LoginState.signUp());
    final result = await _authService.signUp(email, phoneNumber, firstName);
    result.fold(
      (authError) => emit(LoginState.authError(authError)),
      (right) {
        emailAddress = email.trim();
        auth.authInfo.value = auth.authInfo.value.copyWith(email: email.trim());
        //Store email address into local
        emit(const LoginState.signUpSuccess());
      },
    );
  }

  ///Verify email
  void verifyOtp(String otp) async {
    emit(const LoginState.verifyingOtp());
    final result = await _authService.otpVerify(otp);
    result.fold(
      (authError) => emit(LoginState.authError(authError)),
      (right) => emit(const LoginState.otpVerifySuccess()),
    );
  }

  ///create new password
  void createPassword(String password) async {
    try {
      emit(const LoginState.creatingPassword());

      final result = await _authService.createPassword(password);
      result.fold(
        (authError) => emit(LoginState.authError(authError)),
        (token) async {
          _tokenCubit.clearToken();
          if (emailAddress.isEmpty) {
            emailAddress = auth.authInfo.value.email ?? '';
          }

          ///Save token into  local storage
          token = token.copyWith(email: emailAddress.trim());
          _tokenCubit.setToken(token);
          // Updating sas token
          updatingSASToken();
          emit(const LoginState.authorized());
        },
      );
    } catch (e) {
      return emit(const LoginState.authError(AuthException.noInternet()));
    }
  }

  ///Logout user
  ///
  Future<void> logout() async {
    emit(const LoginState.logout());
    final result =
        await _authService.logout(auth.authInfo.value.refreshToken ?? '');
    result.fold(
      (authError) => emit(LoginState.authError(authError)),
      (token) {
        ///Clear token in  local storage
        _tokenCubit.clearAppData();
        appRouter.go(ScreenPath.login);
        emit(const LoginState.logoutSuccess());
      },
    );
  }
}
