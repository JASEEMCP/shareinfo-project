// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_submission_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FeedbackSubmissionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingFeedback,
    required TResult Function(MainFailure e) error,
    required TResult Function() feedbackSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingFeedback,
    TResult? Function(MainFailure e)? error,
    TResult? Function()? feedbackSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingFeedback,
    TResult Function(MainFailure e)? error,
    TResult Function()? feedbackSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingFeedback value) sendingFeedback,
    required TResult Function(_Error value) error,
    required TResult Function(_FeedbackSubmitted value) feedbackSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingFeedback value)? sendingFeedback,
    TResult? Function(_Error value)? error,
    TResult? Function(_FeedbackSubmitted value)? feedbackSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingFeedback value)? sendingFeedback,
    TResult Function(_Error value)? error,
    TResult Function(_FeedbackSubmitted value)? feedbackSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackSubmissionStateCopyWith<$Res> {
  factory $FeedbackSubmissionStateCopyWith(FeedbackSubmissionState value,
          $Res Function(FeedbackSubmissionState) then) =
      _$FeedbackSubmissionStateCopyWithImpl<$Res, FeedbackSubmissionState>;
}

/// @nodoc
class _$FeedbackSubmissionStateCopyWithImpl<$Res,
        $Val extends FeedbackSubmissionState>
    implements $FeedbackSubmissionStateCopyWith<$Res> {
  _$FeedbackSubmissionStateCopyWithImpl(this._value, this._then);

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
    extends _$FeedbackSubmissionStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FeedbackSubmissionState.initial()';
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
    required TResult Function() sendingFeedback,
    required TResult Function(MainFailure e) error,
    required TResult Function() feedbackSubmitted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingFeedback,
    TResult? Function(MainFailure e)? error,
    TResult? Function()? feedbackSubmitted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingFeedback,
    TResult Function(MainFailure e)? error,
    TResult Function()? feedbackSubmitted,
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
    required TResult Function(_SendingFeedback value) sendingFeedback,
    required TResult Function(_Error value) error,
    required TResult Function(_FeedbackSubmitted value) feedbackSubmitted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingFeedback value)? sendingFeedback,
    TResult? Function(_Error value)? error,
    TResult? Function(_FeedbackSubmitted value)? feedbackSubmitted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingFeedback value)? sendingFeedback,
    TResult Function(_Error value)? error,
    TResult Function(_FeedbackSubmitted value)? feedbackSubmitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FeedbackSubmissionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SendingFeedbackImplCopyWith<$Res> {
  factory _$$SendingFeedbackImplCopyWith(_$SendingFeedbackImpl value,
          $Res Function(_$SendingFeedbackImpl) then) =
      __$$SendingFeedbackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendingFeedbackImplCopyWithImpl<$Res>
    extends _$FeedbackSubmissionStateCopyWithImpl<$Res, _$SendingFeedbackImpl>
    implements _$$SendingFeedbackImplCopyWith<$Res> {
  __$$SendingFeedbackImplCopyWithImpl(
      _$SendingFeedbackImpl _value, $Res Function(_$SendingFeedbackImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendingFeedbackImpl implements _SendingFeedback {
  const _$SendingFeedbackImpl();

  @override
  String toString() {
    return 'FeedbackSubmissionState.sendingFeedback()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendingFeedbackImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingFeedback,
    required TResult Function(MainFailure e) error,
    required TResult Function() feedbackSubmitted,
  }) {
    return sendingFeedback();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingFeedback,
    TResult? Function(MainFailure e)? error,
    TResult? Function()? feedbackSubmitted,
  }) {
    return sendingFeedback?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingFeedback,
    TResult Function(MainFailure e)? error,
    TResult Function()? feedbackSubmitted,
    required TResult orElse(),
  }) {
    if (sendingFeedback != null) {
      return sendingFeedback();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingFeedback value) sendingFeedback,
    required TResult Function(_Error value) error,
    required TResult Function(_FeedbackSubmitted value) feedbackSubmitted,
  }) {
    return sendingFeedback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingFeedback value)? sendingFeedback,
    TResult? Function(_Error value)? error,
    TResult? Function(_FeedbackSubmitted value)? feedbackSubmitted,
  }) {
    return sendingFeedback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingFeedback value)? sendingFeedback,
    TResult Function(_Error value)? error,
    TResult Function(_FeedbackSubmitted value)? feedbackSubmitted,
    required TResult orElse(),
  }) {
    if (sendingFeedback != null) {
      return sendingFeedback(this);
    }
    return orElse();
  }
}

abstract class _SendingFeedback implements FeedbackSubmissionState {
  const factory _SendingFeedback() = _$SendingFeedbackImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MainFailure e});

  $MainFailureCopyWith<$Res> get e;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FeedbackSubmissionStateCopyWithImpl<$Res, _$ErrorImpl>
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
              as MainFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MainFailureCopyWith<$Res> get e {
    return $MainFailureCopyWith<$Res>(_value.e, (value) {
      return _then(_value.copyWith(e: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.e);

  @override
  final MainFailure e;

  @override
  String toString() {
    return 'FeedbackSubmissionState.error(e: $e)';
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
    required TResult Function() initial,
    required TResult Function() sendingFeedback,
    required TResult Function(MainFailure e) error,
    required TResult Function() feedbackSubmitted,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingFeedback,
    TResult? Function(MainFailure e)? error,
    TResult? Function()? feedbackSubmitted,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingFeedback,
    TResult Function(MainFailure e)? error,
    TResult Function()? feedbackSubmitted,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingFeedback value) sendingFeedback,
    required TResult Function(_Error value) error,
    required TResult Function(_FeedbackSubmitted value) feedbackSubmitted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingFeedback value)? sendingFeedback,
    TResult? Function(_Error value)? error,
    TResult? Function(_FeedbackSubmitted value)? feedbackSubmitted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingFeedback value)? sendingFeedback,
    TResult Function(_Error value)? error,
    TResult Function(_FeedbackSubmitted value)? feedbackSubmitted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FeedbackSubmissionState {
  const factory _Error(final MainFailure e) = _$ErrorImpl;

  MainFailure get e;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedbackSubmittedImplCopyWith<$Res> {
  factory _$$FeedbackSubmittedImplCopyWith(_$FeedbackSubmittedImpl value,
          $Res Function(_$FeedbackSubmittedImpl) then) =
      __$$FeedbackSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedbackSubmittedImplCopyWithImpl<$Res>
    extends _$FeedbackSubmissionStateCopyWithImpl<$Res, _$FeedbackSubmittedImpl>
    implements _$$FeedbackSubmittedImplCopyWith<$Res> {
  __$$FeedbackSubmittedImplCopyWithImpl(_$FeedbackSubmittedImpl _value,
      $Res Function(_$FeedbackSubmittedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FeedbackSubmittedImpl implements _FeedbackSubmitted {
  const _$FeedbackSubmittedImpl();

  @override
  String toString() {
    return 'FeedbackSubmissionState.feedbackSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FeedbackSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingFeedback,
    required TResult Function(MainFailure e) error,
    required TResult Function() feedbackSubmitted,
  }) {
    return feedbackSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingFeedback,
    TResult? Function(MainFailure e)? error,
    TResult? Function()? feedbackSubmitted,
  }) {
    return feedbackSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingFeedback,
    TResult Function(MainFailure e)? error,
    TResult Function()? feedbackSubmitted,
    required TResult orElse(),
  }) {
    if (feedbackSubmitted != null) {
      return feedbackSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingFeedback value) sendingFeedback,
    required TResult Function(_Error value) error,
    required TResult Function(_FeedbackSubmitted value) feedbackSubmitted,
  }) {
    return feedbackSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingFeedback value)? sendingFeedback,
    TResult? Function(_Error value)? error,
    TResult? Function(_FeedbackSubmitted value)? feedbackSubmitted,
  }) {
    return feedbackSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingFeedback value)? sendingFeedback,
    TResult Function(_Error value)? error,
    TResult Function(_FeedbackSubmitted value)? feedbackSubmitted,
    required TResult orElse(),
  }) {
    if (feedbackSubmitted != null) {
      return feedbackSubmitted(this);
    }
    return orElse();
  }
}

abstract class _FeedbackSubmitted implements FeedbackSubmissionState {
  const factory _FeedbackSubmitted() = _$FeedbackSubmittedImpl;
}
