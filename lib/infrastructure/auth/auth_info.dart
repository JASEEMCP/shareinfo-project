import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/auth/model/token_model.dart';
import '../../domain/common/auth_load_and save.dart';

@LazySingleton()
class AuthInfo with AuthLoadAndSaveMixin {
  late final authInfo = ValueNotifier<Token>(
    const Token(
      accessToken: null,
      refreshToken: null,
      isProfileCreated: false,
      fullName: null,
      isStudent: false,
      profilePhoto: null,
      fcmToken: null,
    ),
  )..addListener(save);

  @override
  void copyFromJson(Map<String, dynamic> data) {
    authInfo.value = Token.fromJson(data);
  }

  @override
  String get fileName => 'auth.dat';

  @override
  Map<String, dynamic> toJson() {
    return authInfo.value.toJson();
  }
}
