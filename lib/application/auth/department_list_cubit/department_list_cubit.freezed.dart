// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DepartmentListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AuthException e) error,
    required TResult Function() fetchingDepartmentList,
    required TResult Function(InstituteData item) successToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AuthException e)? error,
    TResult? Function()? fetchingDepartmentList,
    TResult? Function(InstituteData item)? successToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AuthException e)? error,
    TResult Function()? fetchingDepartmentList,
    TResult Function(InstituteData item)? successToLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingDepartmentList value)
        fetchingDepartmentList,
    required TResult Function(_SuccessToLoad value) successToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult? Function(_SuccessToLoad value)? successToLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult Function(_SuccessToLoad value)? successToLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentListStateCopyWith<$Res> {
  factory $DepartmentListStateCopyWith(
          DepartmentListState value, $Res Function(DepartmentListState) then) =
      _$DepartmentListStateCopyWithImpl<$Res, DepartmentListState>;
}

/// @nodoc
class _$DepartmentListStateCopyWithImpl<$Res, $Val extends DepartmentListState>
    implements $DepartmentListStateCopyWith<$Res> {
  _$DepartmentListStateCopyWithImpl(this._value, this._then);

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
    extends _$DepartmentListStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DepartmentListState.initial()';
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
    required TResult Function(AuthException e) error,
    required TResult Function() fetchingDepartmentList,
    required TResult Function(InstituteData item) successToLoad,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AuthException e)? error,
    TResult? Function()? fetchingDepartmentList,
    TResult? Function(InstituteData item)? successToLoad,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AuthException e)? error,
    TResult Function()? fetchingDepartmentList,
    TResult Function(InstituteData item)? successToLoad,
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
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingDepartmentList value)
        fetchingDepartmentList,
    required TResult Function(_SuccessToLoad value) successToLoad,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult? Function(_SuccessToLoad value)? successToLoad,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult Function(_SuccessToLoad value)? successToLoad,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DepartmentListState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$DepartmentListStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'DepartmentListState.error(e: $e)';
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
    required TResult Function(AuthException e) error,
    required TResult Function() fetchingDepartmentList,
    required TResult Function(InstituteData item) successToLoad,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AuthException e)? error,
    TResult? Function()? fetchingDepartmentList,
    TResult? Function(InstituteData item)? successToLoad,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AuthException e)? error,
    TResult Function()? fetchingDepartmentList,
    TResult Function(InstituteData item)? successToLoad,
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
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingDepartmentList value)
        fetchingDepartmentList,
    required TResult Function(_SuccessToLoad value) successToLoad,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult? Function(_SuccessToLoad value)? successToLoad,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult Function(_SuccessToLoad value)? successToLoad,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DepartmentListState {
  const factory _Error(final AuthException e) = _$ErrorImpl;

  AuthException get e;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchingDepartmentListImplCopyWith<$Res> {
  factory _$$FetchingDepartmentListImplCopyWith(
          _$FetchingDepartmentListImpl value,
          $Res Function(_$FetchingDepartmentListImpl) then) =
      __$$FetchingDepartmentListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchingDepartmentListImplCopyWithImpl<$Res>
    extends _$DepartmentListStateCopyWithImpl<$Res,
        _$FetchingDepartmentListImpl>
    implements _$$FetchingDepartmentListImplCopyWith<$Res> {
  __$$FetchingDepartmentListImplCopyWithImpl(
      _$FetchingDepartmentListImpl _value,
      $Res Function(_$FetchingDepartmentListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchingDepartmentListImpl implements _FetchingDepartmentList {
  const _$FetchingDepartmentListImpl();

  @override
  String toString() {
    return 'DepartmentListState.fetchingDepartmentList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchingDepartmentListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AuthException e) error,
    required TResult Function() fetchingDepartmentList,
    required TResult Function(InstituteData item) successToLoad,
  }) {
    return fetchingDepartmentList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AuthException e)? error,
    TResult? Function()? fetchingDepartmentList,
    TResult? Function(InstituteData item)? successToLoad,
  }) {
    return fetchingDepartmentList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AuthException e)? error,
    TResult Function()? fetchingDepartmentList,
    TResult Function(InstituteData item)? successToLoad,
    required TResult orElse(),
  }) {
    if (fetchingDepartmentList != null) {
      return fetchingDepartmentList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingDepartmentList value)
        fetchingDepartmentList,
    required TResult Function(_SuccessToLoad value) successToLoad,
  }) {
    return fetchingDepartmentList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult? Function(_SuccessToLoad value)? successToLoad,
  }) {
    return fetchingDepartmentList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult Function(_SuccessToLoad value)? successToLoad,
    required TResult orElse(),
  }) {
    if (fetchingDepartmentList != null) {
      return fetchingDepartmentList(this);
    }
    return orElse();
  }
}

abstract class _FetchingDepartmentList implements DepartmentListState {
  const factory _FetchingDepartmentList() = _$FetchingDepartmentListImpl;
}

/// @nodoc
abstract class _$$SuccessToLoadImplCopyWith<$Res> {
  factory _$$SuccessToLoadImplCopyWith(
          _$SuccessToLoadImpl value, $Res Function(_$SuccessToLoadImpl) then) =
      __$$SuccessToLoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InstituteData item});
}

/// @nodoc
class __$$SuccessToLoadImplCopyWithImpl<$Res>
    extends _$DepartmentListStateCopyWithImpl<$Res, _$SuccessToLoadImpl>
    implements _$$SuccessToLoadImplCopyWith<$Res> {
  __$$SuccessToLoadImplCopyWithImpl(
      _$SuccessToLoadImpl _value, $Res Function(_$SuccessToLoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$SuccessToLoadImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as InstituteData,
    ));
  }
}

/// @nodoc

class _$SuccessToLoadImpl implements _SuccessToLoad {
  const _$SuccessToLoadImpl(this.item);

  @override
  final InstituteData item;

  @override
  String toString() {
    return 'DepartmentListState.successToLoad(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessToLoadImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessToLoadImplCopyWith<_$SuccessToLoadImpl> get copyWith =>
      __$$SuccessToLoadImplCopyWithImpl<_$SuccessToLoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AuthException e) error,
    required TResult Function() fetchingDepartmentList,
    required TResult Function(InstituteData item) successToLoad,
  }) {
    return successToLoad(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(AuthException e)? error,
    TResult? Function()? fetchingDepartmentList,
    TResult? Function(InstituteData item)? successToLoad,
  }) {
    return successToLoad?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AuthException e)? error,
    TResult Function()? fetchingDepartmentList,
    TResult Function(InstituteData item)? successToLoad,
    required TResult orElse(),
  }) {
    if (successToLoad != null) {
      return successToLoad(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_FetchingDepartmentList value)
        fetchingDepartmentList,
    required TResult Function(_SuccessToLoad value) successToLoad,
  }) {
    return successToLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult? Function(_SuccessToLoad value)? successToLoad,
  }) {
    return successToLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_FetchingDepartmentList value)? fetchingDepartmentList,
    TResult Function(_SuccessToLoad value)? successToLoad,
    required TResult orElse(),
  }) {
    if (successToLoad != null) {
      return successToLoad(this);
    }
    return orElse();
  }
}

abstract class _SuccessToLoad implements DepartmentListState {
  const factory _SuccessToLoad(final InstituteData item) = _$SuccessToLoadImpl;

  InstituteData get item;
  @JsonKey(ignore: true)
  _$$SuccessToLoadImplCopyWith<_$SuccessToLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
