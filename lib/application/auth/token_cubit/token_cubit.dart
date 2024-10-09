import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shareinfo/application/happening/happening_list_cubit/happening_list_cubit.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/auth/model/token_model.dart';
import 'package:shareinfo/domain/auth/service/auth_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/main_screen/main_screen.dart';
import 'package:shareinfo/router/router_path.dart';
part 'token_state.dart';
part 'token_cubit.freezed.dart';

@LazySingleton()
class TokenCubit extends Cubit<TokenState> {
  final AuthService _authService;
  TokenCubit(this._authService) : super(const TokenState.initial());

  void initTokenState() {
    final refresh = auth.authInfo.value.refreshToken;
    final isProfileCreated = auth.authInfo.value.isProfileCreated ?? false;
    try {
      ///checking token expiration status from given refresh token
      ///preventing user enter home screen without completing pre-profile
      if (!JwtDecoder.isExpired(refresh.toString()) && isProfileCreated) {
        emit(TokenState.authorized(auth.authInfo.value));
      } else {
        clearAppData();
      }
    } catch (e) {
      clearAppData();
    }
  }

  ///Set token
  void setToken(Token token) {
    ///Store token data into local storage
    auth.authInfo.value =
        token.copyWith(fcmToken: auth.authInfo.value.fcmToken);

    emit(TokenState.authorized(token));
  }

  ///set access token
  void setAccessToken(String accessToken) {
    auth.authInfo.value = auth.authInfo.value.copyWith(
      accessToken: accessToken,
    );
  }

  ///Set value into true while user complete pre-profile
  void setPreProfileValue() {
    ///Assign pre-profile value into true after user completing profile creation
    auth.authInfo.value = auth.authInfo.value.copyWith(isProfileCreated: true);

    emit(TokenState.authorized(auth.authInfo.value));
  }

  ///Clear token
  void clearToken() {
    auth.authInfo.value = auth.authInfo.value.copyWith(
      accessToken: null,
      refreshToken: null,
      isProfileCreated: false,
      fullName: null,
      profilePhoto: null,
      isStudent: false,
    );
    emit(const TokenState.initial());
  }

  ///Clear app data
  void clearAppData() async {
    //Reset navbar index to default 0
    tabChangeNotifier.value = 0;
    //Clear auth info
    auth.authInfo.value = auth.authInfo.value.copyWith(
      accessToken: null,
      refreshToken: null,
      isProfileCreated: false,
      fullName: null,
      email: null,
      profilePhoto: null,
      isStudent: false,
    );
    //Clear profile cache
    getIt<ProfileBloc>().add(const ProfileEvent.clearModel());
    //Clear job cache
    getIt<JobListCubit>().clearJobList();
    //Clearing home cache
    getIt<HomeCubit>().clearData();
    //Clear happening cache
    getIt<HappeningListCubit>().clearData();

    emit(const TokenState.initial());
  }

  ///set access token
  void setRefreshToken(String? refreshToken) {
    auth.authInfo.value = auth.authInfo.value.copyWith(
      refreshToken: refreshToken,
    );
  }

  ///Get new access token
  Future<String?> refreshToken(String refreshToken) async {
    final newToken = await _authService.refresh(refreshToken);

    final authToken = newToken.fold(
      (failure) {
        clearAppData();
        appRouter.go(ScreenPath.login);
        return null;
      },
      (token) {
        setAccessToken(token.accessToken ?? '');
        emit(TokenState.authorized(token));
        return token.accessToken;
      },
    );
    return authToken;
  }
}
