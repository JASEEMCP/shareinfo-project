// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'academic_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AcademicInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  AcademicInfoModel get userData => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  MainFailure? get error => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get saveSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AcademicInfoStateCopyWith<AcademicInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcademicInfoStateCopyWith<$Res> {
  factory $AcademicInfoStateCopyWith(
          AcademicInfoState value, $Res Function(AcademicInfoState) then) =
      _$AcademicInfoStateCopyWithImpl<$Res, AcademicInfoState>;
  @useResult
  $Res call(
      {bool isLoading,
      AcademicInfoModel userData,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess});

  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$AcademicInfoStateCopyWithImpl<$Res, $Val extends AcademicInfoState>
    implements $AcademicInfoStateCopyWith<$Res> {
  _$AcademicInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userData = null,
    Object? isSaving = null,
    Object? isError = null,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? saveSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as AcademicInfoModel,
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
abstract class _$$AcademicInfoStateImplCopyWith<$Res>
    implements $AcademicInfoStateCopyWith<$Res> {
  factory _$$AcademicInfoStateImplCopyWith(_$AcademicInfoStateImpl value,
          $Res Function(_$AcademicInfoStateImpl) then) =
      __$$AcademicInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AcademicInfoModel userData,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess});

  @override
  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$AcademicInfoStateImplCopyWithImpl<$Res>
    extends _$AcademicInfoStateCopyWithImpl<$Res, _$AcademicInfoStateImpl>
    implements _$$AcademicInfoStateImplCopyWith<$Res> {
  __$$AcademicInfoStateImplCopyWithImpl(_$AcademicInfoStateImpl _value,
      $Res Function(_$AcademicInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userData = null,
    Object? isSaving = null,
    Object? isError = null,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? saveSuccess = null,
  }) {
    return _then(_$AcademicInfoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as AcademicInfoModel,
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
    ));
  }
}

/// @nodoc

class _$AcademicInfoStateImpl implements _AcademicInfoState {
  const _$AcademicInfoStateImpl(
      {required this.isLoading,
      required this.userData,
      required this.isSaving,
      required this.isError,
      required this.error,
      required this.isSuccess,
      required this.saveSuccess});

  @override
  final bool isLoading;
  @override
  final AcademicInfoModel userData;
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
  String toString() {
    return 'AcademicInfoState(isLoading: $isLoading, userData: $userData, isSaving: $isSaving, isError: $isError, error: $error, isSuccess: $isSuccess, saveSuccess: $saveSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcademicInfoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.saveSuccess, saveSuccess) ||
                other.saveSuccess == saveSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userData, isSaving,
      isError, error, isSuccess, saveSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcademicInfoStateImplCopyWith<_$AcademicInfoStateImpl> get copyWith =>
      __$$AcademicInfoStateImplCopyWithImpl<_$AcademicInfoStateImpl>(
          this, _$identity);
}

abstract class _AcademicInfoState implements AcademicInfoState {
  const factory _AcademicInfoState(
      {required final bool isLoading,
      required final AcademicInfoModel userData,
      required final bool isSaving,
      required final bool isError,
      required final MainFailure? error,
      required final bool isSuccess,
      required final bool saveSuccess}) = _$AcademicInfoStateImpl;

  @override
  bool get isLoading;
  @override
  AcademicInfoModel get userData;
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
  @JsonKey(ignore: true)
  _$$AcademicInfoStateImplCopyWith<_$AcademicInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
