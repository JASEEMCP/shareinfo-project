// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_otp_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResendOtpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthException e) error,
    required TResult Function() reSendingOtp,
    required TResult Function(int t) timerRunning,
    required TResult Function() timerInitial,
    required TResult Function() reSendOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthException e)? error,
    TResult? Function()? reSendingOtp,
    TResult? Function(int t)? timerRunning,
    TResult? Function()? timerInitial,
    TResult? Function()? reSendOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthException e)? error,
    TResult Function()? reSendingOtp,
    TResult Function(int t)? timerRunning,
    TResult Function()? timerInitial,
    TResult Function()? reSendOtpSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_ReSendingOtp value) reSendingOtp,
    required TResult Function(_TimerRunning value) timerRunning,
    required TResult Function(_TimerInitial value) timerInitial,
    required TResult Function(_ReSendOtpSuccess value) reSendOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_ReSendingOtp value)? reSendingOtp,
    TResult? Function(_TimerRunning value)? timerRunning,
    TResult? Function(_TimerInitial value)? timerInitial,
    TResult? Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_ReSendingOtp value)? reSendingOtp,
    TResult Function(_TimerRunning value)? timerRunning,
    TResult Function(_TimerInitial value)? timerInitial,
    TResult Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpStateCopyWith<$Res> {
  factory $ResendOtpStateCopyWith(
          ResendOtpState value, $Res Function(ResendOtpState) then) =
      _$ResendOtpStateCopyWithImpl<$Res, ResendOtpState>;
}

/// @nodoc
class _$ResendOtpStateCopyWithImpl<$Res, $Val extends ResendOtpState>
    implements $ResendOtpStateCopyWith<$Res> {
  _$ResendOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthException e});

  $AuthExceptionCopyWith<$Res> get e;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ResendOtpStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$ErrorImpl(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as AuthException,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthExceptionCopyWith<$Res> get e {
    return $AuthExceptionCopyWith<$Res>(_value.e, (value) {
      return _then(_value.copyWith(e: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.e);

  @override
  final AuthException e;

  @override
  String toString() {
    return 'ResendOtpState.error(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthException e) error,
    required TResult Function() reSendingOtp,
    required TResult Function(int t) timerRunning,
    required TResult Function() timerInitial,
    required TResult Function() reSendOtpSuccess,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthException e)? error,
    TResult? Function()? reSendingOtp,
    TResult? Function(int t)? timerRunning,
    TResult? Function()? timerInitial,
    TResult? Function()? reSendOtpSuccess,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthException e)? error,
    TResult Function()? reSendingOtp,
    TResult Function(int t)? timerRunning,
    TResult Function()? timerInitial,
    TResult Function()? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_ReSendingOtp value) reSendingOtp,
    required TResult Function(_TimerRunning value) timerRunning,
    required TResult Function(_TimerInitial value) timerInitial,
    required TResult Function(_ReSendOtpSuccess value) reSendOtpSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_ReSendingOtp value)? reSendingOtp,
    TResult? Function(_TimerRunning value)? timerRunning,
    TResult? Function(_TimerInitial value)? timerInitial,
    TResult? Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_ReSendingOtp value)? reSendingOtp,
    TResult Function(_TimerRunning value)? timerRunning,
    TResult Function(_TimerInitial value)? timerInitial,
    TResult Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ResendOtpState {
  const factory _Error(final AuthException e) = _$ErrorImpl;

  AuthException get e;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReSendingOtpImplCopyWith<$Res> {
  factory _$$ReSendingOtpImplCopyWith(
          _$ReSendingOtpImpl value, $Res Function(_$ReSendingOtpImpl) then) =
      __$$ReSendingOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReSendingOtpImplCopyWithImpl<$Res>
    extends _$ResendOtpStateCopyWithImpl<$Res, _$ReSendingOtpImpl>
    implements _$$ReSendingOtpImplCopyWith<$Res> {
  __$$ReSendingOtpImplCopyWithImpl(
      _$ReSendingOtpImpl _value, $Res Function(_$ReSendingOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReSendingOtpImpl implements _ReSendingOtp {
  const _$ReSendingOtpImpl();

  @override
  String toString() {
    return 'ResendOtpState.reSendingOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReSendingOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthException e) error,
    required TResult Function() reSendingOtp,
    required TResult Function(int t) timerRunning,
    required TResult Function() timerInitial,
    required TResult Function() reSendOtpSuccess,
  }) {
    return reSendingOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthException e)? error,
    TResult? Function()? reSendingOtp,
    TResult? Function(int t)? timerRunning,
    TResult? Function()? timerInitial,
    TResult? Function()? reSendOtpSuccess,
  }) {
    return reSendingOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthException e)? error,
    TResult Function()? reSendingOtp,
    TResult Function(int t)? timerRunning,
    TResult Function()? timerInitial,
    TResult Function()? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (reSendingOtp != null) {
      return reSendingOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_ReSendingOtp value) reSendingOtp,
    required TResult Function(_TimerRunning value) timerRunning,
    required TResult Function(_TimerInitial value) timerInitial,
    required TResult Function(_ReSendOtpSuccess value) reSendOtpSuccess,
  }) {
    return reSendingOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_ReSendingOtp value)? reSendingOtp,
    TResult? Function(_TimerRunning value)? timerRunning,
    TResult? Function(_TimerInitial value)? timerInitial,
    TResult? Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
  }) {
    return reSendingOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_ReSendingOtp value)? reSendingOtp,
    TResult Function(_TimerRunning value)? timerRunning,
    TResult Function(_TimerInitial value)? timerInitial,
    TResult Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (reSendingOtp != null) {
      return reSendingOtp(this);
    }
    return orElse();
  }
}

abstract class _ReSendingOtp implements ResendOtpState {
  const factory _ReSendingOtp() = _$ReSendingOtpImpl;
}

/// @nodoc
abstract class _$$TimerRunningImplCopyWith<$Res> {
  factory _$$TimerRunningImplCopyWith(
          _$TimerRunningImpl value, $Res Function(_$TimerRunningImpl) then) =
      __$$TimerRunningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int t});
}

/// @nodoc
class __$$TimerRunningImplCopyWithImpl<$Res>
    extends _$ResendOtpStateCopyWithImpl<$Res, _$TimerRunningImpl>
    implements _$$TimerRunningImplCopyWith<$Res> {
  __$$TimerRunningImplCopyWithImpl(
      _$TimerRunningImpl _value, $Res Function(_$TimerRunningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = null,
  }) {
    return _then(_$TimerRunningImpl(
      null == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerRunningImpl implements _TimerRunning {
  const _$TimerRunningImpl(this.t);

  @override
  final int t;

  @override
  String toString() {
    return 'ResendOtpState.timerRunning(t: $t)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunningImpl &&
            (identical(other.t, t) || other.t == t));
  }

  @override
  int get hashCode => Object.hash(runtimeType, t);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      __$$TimerRunningImplCopyWithImpl<_$TimerRunningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthException e) error,
    required TResult Function() reSendingOtp,
    required TResult Function(int t) timerRunning,
    required TResult Function() timerInitial,
    required TResult Function() reSendOtpSuccess,
  }) {
    return timerRunning(t);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthException e)? error,
    TResult? Function()? reSendingOtp,
    TResult? Function(int t)? timerRunning,
    TResult? Function()? timerInitial,
    TResult? Function()? reSendOtpSuccess,
  }) {
    return timerRunning?.call(t);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthException e)? error,
    TResult Function()? reSendingOtp,
    TResult Function(int t)? timerRunning,
    TResult Function()? timerInitial,
    TResult Function()? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (timerRunning != null) {
      return timerRunning(t);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_ReSendingOtp value) reSendingOtp,
    required TResult Function(_TimerRunning value) timerRunning,
    required TResult Function(_TimerInitial value) timerInitial,
    required TResult Function(_ReSendOtpSuccess value) reSendOtpSuccess,
  }) {
    return timerRunning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_ReSendingOtp value)? reSendingOtp,
    TResult? Function(_TimerRunning value)? timerRunning,
    TResult? Function(_TimerInitial value)? timerInitial,
    TResult? Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
  }) {
    return timerRunning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_ReSendingOtp value)? reSendingOtp,
    TResult Function(_TimerRunning value)? timerRunning,
    TResult Function(_TimerInitial value)? timerInitial,
    TResult Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (timerRunning != null) {
      return timerRunning(this);
    }
    return orElse();
  }
}

abstract class _TimerRunning implements ResendOtpState {
  const factory _TimerRunning(final int t) = _$TimerRunningImpl;

  int get t;
  @JsonKey(ignore: true)
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerInitialImplCopyWith<$Res> {
  factory _$$TimerInitialImplCopyWith(
          _$TimerInitialImpl value, $Res Function(_$TimerInitialImpl) then) =
      __$$TimerInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerInitialImplCopyWithImpl<$Res>
    extends _$ResendOtpStateCopyWithImpl<$Res, _$TimerInitialImpl>
    implements _$$TimerInitialImplCopyWith<$Res> {
  __$$TimerInitialImplCopyWithImpl(
      _$TimerInitialImpl _value, $Res Function(_$TimerInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerInitialImpl implements _TimerInitial {
  const _$TimerInitialImpl();

  @override
  String toString() {
    return 'ResendOtpState.timerInitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthException e) error,
    required TResult Function() reSendingOtp,
    required TResult Function(int t) timerRunning,
    required TResult Function() timerInitial,
    required TResult Function() reSendOtpSuccess,
  }) {
    return timerInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthException e)? error,
    TResult? Function()? reSendingOtp,
    TResult? Function(int t)? timerRunning,
    TResult? Function()? timerInitial,
    TResult? Function()? reSendOtpSuccess,
  }) {
    return timerInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthException e)? error,
    TResult Function()? reSendingOtp,
    TResult Function(int t)? timerRunning,
    TResult Function()? timerInitial,
    TResult Function()? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (timerInitial != null) {
      return timerInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_ReSendingOtp value) reSendingOtp,
    required TResult Function(_TimerRunning value) timerRunning,
    required TResult Function(_TimerInitial value) timerInitial,
    required TResult Function(_ReSendOtpSuccess value) reSendOtpSuccess,
  }) {
    return timerInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_ReSendingOtp value)? reSendingOtp,
    TResult? Function(_TimerRunning value)? timerRunning,
    TResult? Function(_TimerInitial value)? timerInitial,
    TResult? Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
  }) {
    return timerInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_ReSendingOtp value)? reSendingOtp,
    TResult Function(_TimerRunning value)? timerRunning,
    TResult Function(_TimerInitial value)? timerInitial,
    TResult Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (timerInitial != null) {
      return timerInitial(this);
    }
    return orElse();
  }
}

abstract class _TimerInitial implements ResendOtpState {
  const factory _TimerInitial() = _$TimerInitialImpl;
}

/// @nodoc
abstract class _$$ReSendOtpSuccessImplCopyWith<$Res> {
  factory _$$ReSendOtpSuccessImplCopyWith(_$ReSendOtpSuccessImpl value,
          $Res Function(_$ReSendOtpSuccessImpl) then) =
      __$$ReSendOtpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReSendOtpSuccessImplCopyWithImpl<$Res>
    extends _$ResendOtpStateCopyWithImpl<$Res, _$ReSendOtpSuccessImpl>
    implements _$$ReSendOtpSuccessImplCopyWith<$Res> {
  __$$ReSendOtpSuccessImplCopyWithImpl(_$ReSendOtpSuccessImpl _value,
      $Res Function(_$ReSendOtpSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReSendOtpSuccessImpl implements _ReSendOtpSuccess {
  const _$ReSendOtpSuccessImpl();

  @override
  String toString() {
    return 'ResendOtpState.reSendOtpSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReSendOtpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthException e) error,
    required TResult Function() reSendingOtp,
    required TResult Function(int t) timerRunning,
    required TResult Function() timerInitial,
    required TResult Function() reSendOtpSuccess,
  }) {
    return reSendOtpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthException e)? error,
    TResult? Function()? reSendingOtp,
    TResult? Function(int t)? timerRunning,
    TResult? Function()? timerInitial,
    TResult? Function()? reSendOtpSuccess,
  }) {
    return reSendOtpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthException e)? error,
    TResult Function()? reSendingOtp,
    TResult Function(int t)? timerRunning,
    TResult Function()? timerInitial,
    TResult Function()? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (reSendOtpSuccess != null) {
      return reSendOtpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_ReSendingOtp value) reSendingOtp,
    required TResult Function(_TimerRunning value) timerRunning,
    required TResult Function(_TimerInitial value) timerInitial,
    required TResult Function(_ReSendOtpSuccess value) reSendOtpSuccess,
  }) {
    return reSendOtpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_ReSendingOtp value)? reSendingOtp,
    TResult? Function(_TimerRunning value)? timerRunning,
    TResult? Function(_TimerInitial value)? timerInitial,
    TResult? Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
  }) {
    return reSendOtpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_ReSendingOtp value)? reSendingOtp,
    TResult Function(_TimerRunning value)? timerRunning,
    TResult Function(_TimerInitial value)? timerInitial,
    TResult Function(_ReSendOtpSuccess value)? reSendOtpSuccess,
    required TResult orElse(),
  }) {
    if (reSendOtpSuccess != null) {
      return reSendOtpSuccess(this);
    }
    return orElse();
  }
}

abstract class _ReSendOtpSuccess implements ResendOtpState {
  const factory _ReSendOtpSuccess() = _$ReSendOtpSuccessImpl;
}
