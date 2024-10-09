part of 'token_cubit.dart';

@freezed
class TokenState with _$TokenState {
  const factory TokenState.initial() = _Initial;
  const factory TokenState.authorized(Token token) = _Authorized;
}

extension TokenStateX on TokenState {
  String? get accessToken =>
      maybeWhen(authorized: (token) => token.accessToken, orElse: () => null);
  String? get refreshToken =>
      maybeWhen(authorized: (token) => token.refreshToken, orElse: () => null);

  ///getting value user authenticated or not
  bool get isInitial => maybeWhen(orElse: () => false, initial: () => true);

  ///Assign value to header
  Map<String, String> toAuthorizationHeader() => maybeWhen(
        authorized: (token) => {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.accessToken}",
        },
        orElse: () => {
          'Content-Type': 'application/json',
        },
      );
}
