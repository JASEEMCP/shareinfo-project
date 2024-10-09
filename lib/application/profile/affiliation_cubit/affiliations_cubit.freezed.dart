// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affiliations_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AffiliationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  AffiliationsModel get userModel => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  MainFailure? get error => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get saveSuccess => throw _privateConstructorUsedError;
  bool get deleteSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AffiliationsStateCopyWith<AffiliationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffiliationsStateCopyWith<$Res> {
  factory $AffiliationsStateCopyWith(
          AffiliationsState value, $Res Function(AffiliationsState) then) =
      _$AffiliationsStateCopyWithImpl<$Res, AffiliationsState>;
  @useResult
  $Res call(
      {bool isLoading,
      AffiliationsModel userModel,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess,
      bool deleteSuccess});

  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$AffiliationsStateCopyWithImpl<$Res, $Val extends AffiliationsState>
    implements $AffiliationsStateCopyWith<$Res> {
  _$AffiliationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = null,
    Object? isSaving = null,
    Object? isError = null,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? saveSuccess = null,
    Object? deleteSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as AffiliationsModel,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as MainFailure?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      saveSuccess: null == saveSuccess
          ? _value.saveSuccess
          : saveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteSuccess: null == deleteSuccess
          ? _value.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainFailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $MainFailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AffiliationsStateImplCopyWith<$Res>
    implements $AffiliationsStateCopyWith<$Res> {
  factory _$$AffiliationsStateImplCopyWith(_$AffiliationsStateImpl value,
          $Res Function(_$AffiliationsStateImpl) then) =
      __$$AffiliationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AffiliationsModel userModel,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess,
      bool deleteSuccess});

  @override
  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$AffiliationsStateImplCopyWithImpl<$Res>
    extends _$AffiliationsStateCopyWithImpl<$Res, _$AffiliationsStateImpl>
    implements _$$AffiliationsStateImplCopyWith<$Res> {
  __$$AffiliationsStateImplCopyWithImpl(_$AffiliationsStateImpl _value,
      $Res Function(_$AffiliationsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userModel = null,
    Object? isSaving = null,
    Object? isError = null,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? saveSuccess = null,
    Object? deleteSuccess = null,
  }) {
    return _then(_$AffiliationsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as AffiliationsModel,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as MainFailure?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      saveSuccess: null == saveSuccess
          ? _value.saveSuccess
          : saveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteSuccess: null == deleteSuccess
          ? _value.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AffiliationsStateImpl implements _AffiliationsState {
  const _$AffiliationsStateImpl(
      {required this.isLoading,
      required this.userModel,
      required this.isSaving,
      required this.isError,
      required this.error,
      required this.isSuccess,
      required this.saveSuccess,
      required this.deleteSuccess});

  @override
  final bool isLoading;
  @override
  final AffiliationsModel userModel;
  @override
  final bool isSaving;
  @override
  final bool isError;
  @override
  final MainFailure? error;
  @override
  final bool isSuccess;
  @override
  final bool saveSuccess;
  @override
  final bool deleteSuccess;

  @override
  String toString() {
    return 'AffiliationsState(isLoading: $isLoading, userModel: $userModel, isSaving: $isSaving, isError: $isError, error: $error, isSuccess: $isSuccess, saveSuccess: $saveSuccess, deleteSuccess: $deleteSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffiliationsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.saveSuccess, saveSuccess) ||
                other.saveSuccess == saveSuccess) &&
            (identical(other.deleteSuccess, deleteSuccess) ||
                other.deleteSuccess == deleteSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userModel, isSaving,
      isError, error, isSuccess, saveSuccess, deleteSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AffiliationsStateImplCopyWith<_$AffiliationsStateImpl> get copyWith =>
      __$$AffiliationsStateImplCopyWithImpl<_$AffiliationsStateImpl>(
          this, _$identity);
}

abstract class _AffiliationsState implements AffiliationsState {
  const factory _AffiliationsState(
      {required final bool isLoading,
      required final AffiliationsModel userModel,
      required final bool isSaving,
      required final bool isError,
      required final MainFailure? error,
      required final bool isSuccess,
      required final bool saveSuccess,
      required final bool deleteSuccess}) = _$AffiliationsStateImpl;

  @override
  bool get isLoading;
  @override
  AffiliationsModel get userModel;
  @override
  bool get isSaving;
  @override
  bool get isError;
  @override
  MainFailure? get error;
  @override
  bool get isSuccess;
  @override
  bool get saveSuccess;
  @override
  bool get deleteSuccess;
  @override
  @JsonKey(ignore: true)
  _$$AffiliationsStateImplCopyWith<_$AffiliationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
