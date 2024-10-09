// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_submission_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileSubmissionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isSubmitting,
    required TResult Function(AuthException e) submissionError,
    required TResult Function() profileCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isSubmitting,
    TResult? Function(AuthException e)? submissionError,
    TResult? Function()? profileCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isSubmitting,
    TResult Function(AuthException e)? submissionError,
    TResult Function()? profileCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsSubmitting value) isSubmitting,
    required TResult Function(_SubmissionError value) submissionError,
    required TResult Function(_ProfileCreated value) profileCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IsSubmitting value)? isSubmitting,
    TResult? Function(_SubmissionError value)? submissionError,
    TResult? Function(_ProfileCreated value)? profileCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsSubmitting value)? isSubmitting,
    TResult Function(_SubmissionError value)? submissionError,
    TResult Function(_ProfileCreated value)? profileCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSubmissionStateCopyWith<$Res> {
  factory $ProfileSubmissionStateCopyWith(ProfileSubmissionState value,
          $Res Function(ProfileSubmissionState) then) =
      _$ProfileSubmissionStateCopyWithImpl<$Res, ProfileSubmissionState>;
}

/// @nodoc
class _$ProfileSubmissionStateCopyWithImpl<$Res,
        $Val extends ProfileSubmissionState>
    implements $ProfileSubmissionStateCopyWith<$Res> {
  _$ProfileSubmissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileSubmissionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileSubmissionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isSubmitting,
    required TResult Function(AuthException e) submissionError,
    required TResult Function() profileCreated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isSubmitting,
    TResult? Function(AuthException e)? submissionError,
    TResult? Function()? profileCreated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isSubmitting,
    TResult Function(AuthException e)? submissionError,
    TResult Function()? profileCreated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsSubmitting value) isSubmitting,
    required TResult Function(_SubmissionError value) submissionError,
    required TResult Function(_ProfileCreated value) profileCreated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IsSubmitting value)? isSubmitting,
    TResult? Function(_SubmissionError value)? submissionError,
    TResult? Function(_ProfileCreated value)? profileCreated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsSubmitting value)? isSubmitting,
    TResult Function(_SubmissionError value)? submissionError,
    TResult Function(_ProfileCreated value)? profileCreated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileSubmissionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$IsSubmittingImplCopyWith<$Res> {
  factory _$$IsSubmittingImplCopyWith(
          _$IsSubmittingImpl value, $Res Function(_$IsSubmittingImpl) then) =
      __$$IsSubmittingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsSubmittingImplCopyWithImpl<$Res>
    extends _$ProfileSubmissionStateCopyWithImpl<$Res, _$IsSubmittingImpl>
    implements _$$IsSubmittingImplCopyWith<$Res> {
  __$$IsSubmittingImplCopyWithImpl(
      _$IsSubmittingImpl _value, $Res Function(_$IsSubmittingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsSubmittingImpl implements _IsSubmitting {
  const _$IsSubmittingImpl();

  @override
  String toString() {
    return 'ProfileSubmissionState.isSubmitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsSubmittingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isSubmitting,
    required TResult Function(AuthException e) submissionError,
    required TResult Function() profileCreated,
  }) {
    return isSubmitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isSubmitting,
    TResult? Function(AuthException e)? submissionError,
    TResult? Function()? profileCreated,
  }) {
    return isSubmitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isSubmitting,
    TResult Function(AuthException e)? submissionError,
    TResult Function()? profileCreated,
    required TResult orElse(),
  }) {
    if (isSubmitting != null) {
      return isSubmitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsSubmitting value) isSubmitting,
    required TResult Function(_SubmissionError value) submissionError,
    required TResult Function(_ProfileCreated value) profileCreated,
  }) {
    return isSubmitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IsSubmitting value)? isSubmitting,
    TResult? Function(_SubmissionError value)? submissionError,
    TResult? Function(_ProfileCreated value)? profileCreated,
  }) {
    return isSubmitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsSubmitting value)? isSubmitting,
    TResult Function(_SubmissionError value)? submissionError,
    TResult Function(_ProfileCreated value)? profileCreated,
    required TResult orElse(),
  }) {
    if (isSubmitting != null) {
      return isSubmitting(this);
    }
    return orElse();
  }
}

abstract class _IsSubmitting implements ProfileSubmissionState {
  const factory _IsSubmitting() = _$IsSubmittingImpl;
}

/// @nodoc
abstract class _$$SubmissionErrorImplCopyWith<$Res> {
  factory _$$SubmissionErrorImplCopyWith(_$SubmissionErrorImpl value,
          $Res Function(_$SubmissionErrorImpl) then) =
      __$$SubmissionErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthException e});

  $AuthExceptionCopyWith<$Res> get e;
}

/// @nodoc
class __$$SubmissionErrorImplCopyWithImpl<$Res>
    extends _$ProfileSubmissionStateCopyWithImpl<$Res, _$SubmissionErrorImpl>
    implements _$$SubmissionErrorImplCopyWith<$Res> {
  __$$SubmissionErrorImplCopyWithImpl(
      _$SubmissionErrorImpl _value, $Res Function(_$SubmissionErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$SubmissionErrorImpl(
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

class _$SubmissionErrorImpl implements _SubmissionError {
  const _$SubmissionErrorImpl(this.e);

  @override
  final AuthException e;

  @override
  String toString() {
    return 'ProfileSubmissionState.submissionError(e: $e)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionErrorImpl &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionErrorImplCopyWith<_$SubmissionErrorImpl> get copyWith =>
      __$$SubmissionErrorImplCopyWithImpl<_$SubmissionErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isSubmitting,
    required TResult Function(AuthException e) submissionError,
    required TResult Function() profileCreated,
  }) {
    return submissionError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isSubmitting,
    TResult? Function(AuthException e)? submissionError,
    TResult? Function()? profileCreated,
  }) {
    return submissionError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isSubmitting,
    TResult Function(AuthException e)? submissionError,
    TResult Function()? profileCreated,
    required TResult orElse(),
  }) {
    if (submissionError != null) {
      return submissionError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsSubmitting value) isSubmitting,
    required TResult Function(_SubmissionError value) submissionError,
    required TResult Function(_ProfileCreated value) profileCreated,
  }) {
    return submissionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IsSubmitting value)? isSubmitting,
    TResult? Function(_SubmissionError value)? submissionError,
    TResult? Function(_ProfileCreated value)? profileCreated,
  }) {
    return submissionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsSubmitting value)? isSubmitting,
    TResult Function(_SubmissionError value)? submissionError,
    TResult Function(_ProfileCreated value)? profileCreated,
    required TResult orElse(),
  }) {
    if (submissionError != null) {
      return submissionError(this);
    }
    return orElse();
  }
}

abstract class _SubmissionError implements ProfileSubmissionState {
  const factory _SubmissionError(final AuthException e) = _$SubmissionErrorImpl;

  AuthException get e;
  @JsonKey(ignore: true)
  _$$SubmissionErrorImplCopyWith<_$SubmissionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileCreatedImplCopyWith<$Res> {
  factory _$$ProfileCreatedImplCopyWith(_$ProfileCreatedImpl value,
          $Res Function(_$ProfileCreatedImpl) then) =
      __$$ProfileCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileCreatedImplCopyWithImpl<$Res>
    extends _$ProfileSubmissionStateCopyWithImpl<$Res, _$ProfileCreatedImpl>
    implements _$$ProfileCreatedImplCopyWith<$Res> {
  __$$ProfileCreatedImplCopyWithImpl(
      _$ProfileCreatedImpl _value, $Res Function(_$ProfileCreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileCreatedImpl implements _ProfileCreated {
  const _$ProfileCreatedImpl();

  @override
  String toString() {
    return 'ProfileSubmissionState.profileCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isSubmitting,
    required TResult Function(AuthException e) submissionError,
    required TResult Function() profileCreated,
  }) {
    return profileCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isSubmitting,
    TResult? Function(AuthException e)? submissionError,
    TResult? Function()? profileCreated,
  }) {
    return profileCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isSubmitting,
    TResult Function(AuthException e)? submissionError,
    TResult Function()? profileCreated,
    required TResult orElse(),
  }) {
    if (profileCreated != null) {
      return profileCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IsSubmitting value) isSubmitting,
    required TResult Function(_SubmissionError value) submissionError,
    required TResult Function(_ProfileCreated value) profileCreated,
  }) {
    return profileCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IsSubmitting value)? isSubmitting,
    TResult? Function(_SubmissionError value)? submissionError,
    TResult? Function(_ProfileCreated value)? profileCreated,
  }) {
    return profileCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IsSubmitting value)? isSubmitting,
    TResult Function(_SubmissionError value)? submissionError,
    TResult Function(_ProfileCreated value)? profileCreated,
    required TResult orElse(),
  }) {
    if (profileCreated != null) {
      return profileCreated(this);
    }
    return orElse();
  }
}

abstract class _ProfileCreated implements ProfileSubmissionState {
  const factory _ProfileCreated() = _$ProfileCreatedImpl;
}
