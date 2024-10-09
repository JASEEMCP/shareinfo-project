// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EducationState {
  bool get isLoading => throw _privateConstructorUsedError;
  EducationModel get userModel => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  MainFailure? get error => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get saveSuccess => throw _privateConstructorUsedError;
  bool get deleteSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EducationStateCopyWith<EducationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationStateCopyWith<$Res> {
  factory $EducationStateCopyWith(
          EducationState value, $Res Function(EducationState) then) =
      _$EducationStateCopyWithImpl<$Res, EducationState>;
  @useResult
  $Res call(
      {bool isLoading,
      EducationModel userModel,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess,
      bool deleteSuccess});

  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$EducationStateCopyWithImpl<$Res, $Val extends EducationState>
    implements $EducationStateCopyWith<$Res> {
  _$EducationStateCopyWithImpl(this._value, this._then);

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
              as EducationModel,
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
abstract class _$$EducationStateImplCopyWith<$Res>
    implements $EducationStateCopyWith<$Res> {
  factory _$$EducationStateImplCopyWith(_$EducationStateImpl value,
          $Res Function(_$EducationStateImpl) then) =
      __$$EducationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      EducationModel userModel,
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
class __$$EducationStateImplCopyWithImpl<$Res>
    extends _$EducationStateCopyWithImpl<$Res, _$EducationStateImpl>
    implements _$$EducationStateImplCopyWith<$Res> {
  __$$EducationStateImplCopyWithImpl(
      _$EducationStateImpl _value, $Res Function(_$EducationStateImpl) _then)
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
    return _then(_$EducationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as EducationModel,
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

class _$EducationStateImpl implements _EducationState {
  const _$EducationStateImpl(
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
  final EducationModel userModel;
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
    return 'EducationState(isLoading: $isLoading, userModel: $userModel, isSaving: $isSaving, isError: $isError, error: $error, isSuccess: $isSuccess, saveSuccess: $saveSuccess, deleteSuccess: $deleteSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationStateImpl &&
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
  _$$EducationStateImplCopyWith<_$EducationStateImpl> get copyWith =>
      __$$EducationStateImplCopyWithImpl<_$EducationStateImpl>(
          this, _$identity);
}

abstract class _EducationState implements EducationState {
  const factory _EducationState(
      {required final bool isLoading,
      required final EducationModel userModel,
      required final bool isSaving,
      required final bool isError,
      required final MainFailure? error,
      required final bool isSuccess,
      required final bool saveSuccess,
      required final bool deleteSuccess}) = _$EducationStateImpl;

  @override
  bool get isLoading;
  @override
  EducationModel get userModel;
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
  _$$EducationStateImplCopyWith<_$EducationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
