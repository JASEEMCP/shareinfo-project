// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    @JsonKey(name: 'is_profile_created') bool? isProfileCreated,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'is_student') bool? isStudent,
    @JsonKey(name: 'profile_photo') String? profilePhoto,
    String? fcmToken,
    String? email,
  }) = _Token;
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
