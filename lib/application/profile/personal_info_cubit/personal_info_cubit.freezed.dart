// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonalInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  PersonalInfoModel get userData => throw _privateConstructorUsedError;
  SummaryModel get summaryText => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  MainFailure? get error => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get saveSuccess => throw _privateConstructorUsedError;
  bool get fetchingPincode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalInfoStateCopyWith<PersonalInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoStateCopyWith<$Res> {
  factory $PersonalInfoStateCopyWith(
          PersonalInfoState value, $Res Function(PersonalInfoState) then) =
      _$PersonalInfoStateCopyWithImpl<$Res, PersonalInfoState>;
  @useResult
  $Res call(
      {bool isLoading,
      PersonalInfoModel userData,
      SummaryModel summaryText,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess,
      bool fetchingPincode});

  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$PersonalInfoStateCopyWithImpl<$Res, $Val extends PersonalInfoState>
    implements $PersonalInfoStateCopyWith<$Res> {
  _$PersonalInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userData = null,
    Object? summaryText = null,
    Object? isSaving = null,
    Object? isError = null,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? saveSuccess = null,
    Object? fetchingPincode = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as PersonalInfoModel,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as SummaryModel,
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
      fetchingPincode: null == fetchingPincode
          ? _value.fetchingPincode
          : fetchingPincode // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PersonalInfoStateImplCopyWith<$Res>
    implements $PersonalInfoStateCopyWith<$Res> {
  factory _$$PersonalInfoStateImplCopyWith(_$PersonalInfoStateImpl value,
          $Res Function(_$PersonalInfoStateImpl) then) =
      __$$PersonalInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      PersonalInfoModel userData,
      SummaryModel summaryText,
      bool isSaving,
      bool isError,
      MainFailure? error,
      bool isSuccess,
      bool saveSuccess,
      bool fetchingPincode});

  @override
  $MainFailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$PersonalInfoStateImplCopyWithImpl<$Res>
    extends _$PersonalInfoStateCopyWithImpl<$Res, _$PersonalInfoStateImpl>
    implements _$$PersonalInfoStateImplCopyWith<$Res> {
  __$$PersonalInfoStateImplCopyWithImpl(_$PersonalInfoStateImpl _value,
      $Res Function(_$PersonalInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userData = null,
    Object? summaryText = null,
    Object? isSaving = null,
    Object? isError = null,
    Object? error = freezed,
    Object? isSuccess = null,
    Object? saveSuccess = null,
    Object? fetchingPincode = null,
  }) {
    return _then(_$PersonalInfoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as PersonalInfoModel,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as SummaryModel,
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
      fetchingPincode: null == fetchingPincode
          ? _value.fetchingPincode
          : fetchingPincode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PersonalInfoStateImpl
    with DiagnosticableTreeMixin
    implements _PersonalInfoState {
  const _$PersonalInfoStateImpl(
      {required this.isLoading,
      required this.userData,
      required this.summaryText,
      required this.isSaving,
      required this.isError,
      required this.error,
      required this.isSuccess,
      required this.saveSuccess,
      required this.fetchingPincode});

  @override
  final bool isLoading;
  @override
  final PersonalInfoModel userData;
  @override
  final SummaryModel summaryText;
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
  final bool fetchingPincode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalInfoState(isLoading: $isLoading, userData: $userData, summaryText: $summaryText, isSaving: $isSaving, isError: $isError, error: $error, isSuccess: $isSuccess, saveSuccess: $saveSuccess, fetchingPincode: $fetchingPincode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalInfoState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('userData', userData))
      ..add(DiagnosticsProperty('summaryText', summaryText))
      ..add(DiagnosticsProperty('isSaving', isSaving))
      ..add(DiagnosticsProperty('isError', isError))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('saveSuccess', saveSuccess))
      ..add(DiagnosticsProperty('fetchingPincode', fetchingPincode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.summaryText, summaryText) ||
                other.summaryText == summaryText) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.saveSuccess, saveSuccess) ||
                other.saveSuccess == saveSuccess) &&
            (identical(other.fetchingPincode, fetchingPincode) ||
                other.fetchingPincode == fetchingPincode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userData, summaryText,
      isSaving, isError, error, isSuccess, saveSuccess, fetchingPincode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoStateImplCopyWith<_$PersonalInfoStateImpl> get copyWith =>
      __$$PersonalInfoStateImplCopyWithImpl<_$PersonalInfoStateImpl>(
          this, _$identity);
}

abstract class _PersonalInfoState implements PersonalInfoState {
  const factory _PersonalInfoState(
      {required final bool isLoading,
      required final PersonalInfoModel userData,
      required final SummaryModel summaryText,
      required final bool isSaving,
      required final bool isError,
      required final MainFailure? error,
      required final bool isSuccess,
      required final bool saveSuccess,
      required final bool fetchingPincode}) = _$PersonalInfoStateImpl;

  @override
  bool get isLoading;
  @override
  PersonalInfoModel get userData;
  @override
  SummaryModel get summaryText;
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
  bool get fetchingPincode;
  @override
  @JsonKey(ignore: true)
  _$$PersonalInfoStateImplCopyWith<_$PersonalInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
