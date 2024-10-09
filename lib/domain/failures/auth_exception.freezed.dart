// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(
          AuthException value, $Res Function(AuthException) then) =
      _$AuthExceptionCopyWithImpl<$Res, AuthException>;
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res, $Val extends AuthException>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerErrorImpl with DiagnosticableTreeMixin implements _ServerError {
  const _$ServerErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.serverError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.serverError'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements AuthException {
  const factory _ServerError() = _$ServerErrorImpl;
}

/// @nodoc
abstract class _$$UnAuthorizedImplCopyWith<$Res> {
  factory _$$UnAuthorizedImplCopyWith(
          _$UnAuthorizedImpl value, $Res Function(_$UnAuthorizedImpl) then) =
      __$$UnAuthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnAuthorizedImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UnAuthorizedImpl>
    implements _$$UnAuthorizedImplCopyWith<$Res> {
  __$$UnAuthorizedImplCopyWithImpl(
      _$UnAuthorizedImpl _value, $Res Function(_$UnAuthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnAuthorizedImpl with DiagnosticableTreeMixin implements _UnAuthorized {
  const _$UnAuthorizedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.unAuthorized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.unAuthorized'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnAuthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return unAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return unAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class _UnAuthorized implements AuthException {
  const factory _UnAuthorized() = _$UnAuthorizedImpl;
}

/// @nodoc
abstract class _$$WrongEmailOrPasswordImplCopyWith<$Res> {
  factory _$$WrongEmailOrPasswordImplCopyWith(_$WrongEmailOrPasswordImpl value,
          $Res Function(_$WrongEmailOrPasswordImpl) then) =
      __$$WrongEmailOrPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongEmailOrPasswordImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$WrongEmailOrPasswordImpl>
    implements _$$WrongEmailOrPasswordImplCopyWith<$Res> {
  __$$WrongEmailOrPasswordImplCopyWithImpl(_$WrongEmailOrPasswordImpl _value,
      $Res Function(_$WrongEmailOrPasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WrongEmailOrPasswordImpl
    with DiagnosticableTreeMixin
    implements _WrongEmailOrPassword {
  const _$WrongEmailOrPasswordImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.wrongEmailOrPassword()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthException.wrongEmailOrPassword'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongEmailOrPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return wrongEmailOrPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return wrongEmailOrPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (wrongEmailOrPassword != null) {
      return wrongEmailOrPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return wrongEmailOrPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return wrongEmailOrPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (wrongEmailOrPassword != null) {
      return wrongEmailOrPassword(this);
    }
    return orElse();
  }
}

abstract class _WrongEmailOrPassword implements AuthException {
  const factory _WrongEmailOrPassword() = _$WrongEmailOrPasswordImpl;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnknownImpl with DiagnosticableTreeMixin implements _Unknown {
  const _$UnknownImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.unknown()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.unknown'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements AuthException {
  const factory _Unknown() = _$UnknownImpl;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetImpl with DiagnosticableTreeMixin implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.noInternet()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.noInternet'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements AuthException {
  const factory _NoInternet() = _$NoInternetImpl;
}

/// @nodoc
abstract class _$$UserAlreadyExistImplCopyWith<$Res> {
  factory _$$UserAlreadyExistImplCopyWith(_$UserAlreadyExistImpl value,
          $Res Function(_$UserAlreadyExistImpl) then) =
      __$$UserAlreadyExistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserAlreadyExistImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UserAlreadyExistImpl>
    implements _$$UserAlreadyExistImplCopyWith<$Res> {
  __$$UserAlreadyExistImplCopyWithImpl(_$UserAlreadyExistImpl _value,
      $Res Function(_$UserAlreadyExistImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserAlreadyExistImpl
    with DiagnosticableTreeMixin
    implements _UserAlreadyExist {
  const _$UserAlreadyExistImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.userAlreadyExist()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthException.userAlreadyExist'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserAlreadyExistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return userAlreadyExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return userAlreadyExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (userAlreadyExist != null) {
      return userAlreadyExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return userAlreadyExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return userAlreadyExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (userAlreadyExist != null) {
      return userAlreadyExist(this);
    }
    return orElse();
  }
}

abstract class _UserAlreadyExist implements AuthException {
  const factory _UserAlreadyExist() = _$UserAlreadyExistImpl;
}

/// @nodoc
abstract class _$$InvalidOtpImplCopyWith<$Res> {
  factory _$$InvalidOtpImplCopyWith(
          _$InvalidOtpImpl value, $Res Function(_$InvalidOtpImpl) then) =
      __$$InvalidOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidOtpImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$InvalidOtpImpl>
    implements _$$InvalidOtpImplCopyWith<$Res> {
  __$$InvalidOtpImplCopyWithImpl(
      _$InvalidOtpImpl _value, $Res Function(_$InvalidOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidOtpImpl with DiagnosticableTreeMixin implements _InvalidOtp {
  const _$InvalidOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.invalidOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.invalidOtp'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return invalidOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return invalidOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return invalidOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return invalidOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (invalidOtp != null) {
      return invalidOtp(this);
    }
    return orElse();
  }
}

abstract class _InvalidOtp implements AuthException {
  const factory _InvalidOtp() = _$InvalidOtpImpl;
}

/// @nodoc
abstract class _$$InvalidPasswordImplCopyWith<$Res> {
  factory _$$InvalidPasswordImplCopyWith(_$InvalidPasswordImpl value,
          $Res Function(_$InvalidPasswordImpl) then) =
      __$$InvalidPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidPasswordImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$InvalidPasswordImpl>
    implements _$$InvalidPasswordImplCopyWith<$Res> {
  __$$InvalidPasswordImplCopyWithImpl(
      _$InvalidPasswordImpl _value, $Res Function(_$InvalidPasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidPasswordImpl
    with DiagnosticableTreeMixin
    implements _InvalidPassword {
  const _$InvalidPasswordImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.invalidPassword()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthException.invalidPassword'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return invalidPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class _InvalidPassword implements AuthException {
  const factory _InvalidPassword() = _$InvalidPasswordImpl;
}

/// @nodoc
abstract class _$$UserDoesNotExistImplCopyWith<$Res> {
  factory _$$UserDoesNotExistImplCopyWith(_$UserDoesNotExistImpl value,
          $Res Function(_$UserDoesNotExistImpl) then) =
      __$$UserDoesNotExistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserDoesNotExistImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UserDoesNotExistImpl>
    implements _$$UserDoesNotExistImplCopyWith<$Res> {
  __$$UserDoesNotExistImplCopyWithImpl(_$UserDoesNotExistImpl _value,
      $Res Function(_$UserDoesNotExistImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserDoesNotExistImpl
    with DiagnosticableTreeMixin
    implements _UserDoesNotExist {
  const _$UserDoesNotExistImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.userDoesNotExist()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthException.userDoesNotExist'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserDoesNotExistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return userDoesNotExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return userDoesNotExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (userDoesNotExist != null) {
      return userDoesNotExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return userDoesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return userDoesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (userDoesNotExist != null) {
      return userDoesNotExist(this);
    }
    return orElse();
  }
}

abstract class _UserDoesNotExist implements AuthException {
  const factory _UserDoesNotExist() = _$UserDoesNotExistImpl;
}

/// @nodoc
abstract class _$$SessionExpiredImplCopyWith<$Res> {
  factory _$$SessionExpiredImplCopyWith(_$SessionExpiredImpl value,
          $Res Function(_$SessionExpiredImpl) then) =
      __$$SessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionExpiredImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$SessionExpiredImpl>
    implements _$$SessionExpiredImplCopyWith<$Res> {
  __$$SessionExpiredImplCopyWithImpl(
      _$SessionExpiredImpl _value, $Res Function(_$SessionExpiredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SessionExpiredImpl
    with DiagnosticableTreeMixin
    implements _SessionExpired {
  const _$SessionExpiredImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.sessionExpired()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.sessionExpired'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class _SessionExpired implements AuthException {
  const factory _SessionExpired() = _$SessionExpiredImpl;
}

/// @nodoc
abstract class _$$UploadFailedImplCopyWith<$Res> {
  factory _$$UploadFailedImplCopyWith(
          _$UploadFailedImpl value, $Res Function(_$UploadFailedImpl) then) =
      __$$UploadFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadFailedImplCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$UploadFailedImpl>
    implements _$$UploadFailedImplCopyWith<$Res> {
  __$$UploadFailedImplCopyWithImpl(
      _$UploadFailedImpl _value, $Res Function(_$UploadFailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UploadFailedImpl with DiagnosticableTreeMixin implements _UploadFailed {
  const _$UploadFailedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthException.uploadFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthException.uploadFailed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() unAuthorized,
    required TResult Function() wrongEmailOrPassword,
    required TResult Function() unknown,
    required TResult Function() noInternet,
    required TResult Function() userAlreadyExist,
    required TResult Function() invalidOtp,
    required TResult Function() invalidPassword,
    required TResult Function() userDoesNotExist,
    required TResult Function() sessionExpired,
    required TResult Function() uploadFailed,
  }) {
    return uploadFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? unAuthorized,
    TResult? Function()? wrongEmailOrPassword,
    TResult? Function()? unknown,
    TResult? Function()? noInternet,
    TResult? Function()? userAlreadyExist,
    TResult? Function()? invalidOtp,
    TResult? Function()? invalidPassword,
    TResult? Function()? userDoesNotExist,
    TResult? Function()? sessionExpired,
    TResult? Function()? uploadFailed,
  }) {
    return uploadFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? unAuthorized,
    TResult Function()? wrongEmailOrPassword,
    TResult Function()? unknown,
    TResult Function()? noInternet,
    TResult Function()? userAlreadyExist,
    TResult Function()? invalidOtp,
    TResult Function()? invalidPassword,
    TResult Function()? userDoesNotExist,
    TResult Function()? sessionExpired,
    TResult Function()? uploadFailed,
    required TResult orElse(),
  }) {
    if (uploadFailed != null) {
      return uploadFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_WrongEmailOrPassword value) wrongEmailOrPassword,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_NoInternet value) noInternet,
    required TResult Function(_UserAlreadyExist value) userAlreadyExist,
    required TResult Function(_InvalidOtp value) invalidOtp,
    required TResult Function(_InvalidPassword value) invalidPassword,
    required TResult Function(_UserDoesNotExist value) userDoesNotExist,
    required TResult Function(_SessionExpired value) sessionExpired,
    required TResult Function(_UploadFailed value) uploadFailed,
  }) {
    return uploadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_NoInternet value)? noInternet,
    TResult? Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult? Function(_InvalidOtp value)? invalidOtp,
    TResult? Function(_InvalidPassword value)? invalidPassword,
    TResult? Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult? Function(_SessionExpired value)? sessionExpired,
    TResult? Function(_UploadFailed value)? uploadFailed,
  }) {
    return uploadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_WrongEmailOrPassword value)? wrongEmailOrPassword,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_NoInternet value)? noInternet,
    TResult Function(_UserAlreadyExist value)? userAlreadyExist,
    TResult Function(_InvalidOtp value)? invalidOtp,
    TResult Function(_InvalidPassword value)? invalidPassword,
    TResult Function(_UserDoesNotExist value)? userDoesNotExist,
    TResult Function(_SessionExpired value)? sessionExpired,
    TResult Function(_UploadFailed value)? uploadFailed,
    required TResult orElse(),
  }) {
    if (uploadFailed != null) {
      return uploadFailed(this);
    }
    return orElse();
  }
}

abstract class _UploadFailed implements AuthException {
  const factory _UploadFailed() = _$UploadFailedImpl;
}
