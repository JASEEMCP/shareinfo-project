// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)
        reloadNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)?
        reloadNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)?
        reloadNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ReloadNotification value) reloadNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ReloadNotification value)? reloadNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ReloadNotification value)? reloadNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

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
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NotificationState.initial'));
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
    required TResult Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)
        reloadNotification,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)?
        reloadNotification,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)?
        reloadNotification,
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
    required TResult Function(_ReloadNotification value) reloadNotification,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ReloadNotification value)? reloadNotification,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ReloadNotification value)? reloadNotification,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ReloadNotificationImplCopyWith<$Res> {
  factory _$$ReloadNotificationImplCopyWith(_$ReloadNotificationImpl value,
          $Res Function(_$ReloadNotificationImpl) then) =
      __$$ReloadNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<GeneralNotificationModel> generalList,
      List<ApplicationNotificationModel> applicationList});
}

/// @nodoc
class __$$ReloadNotificationImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$ReloadNotificationImpl>
    implements _$$ReloadNotificationImplCopyWith<$Res> {
  __$$ReloadNotificationImplCopyWithImpl(_$ReloadNotificationImpl _value,
      $Res Function(_$ReloadNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalList = null,
    Object? applicationList = null,
  }) {
    return _then(_$ReloadNotificationImpl(
      generalList: null == generalList
          ? _value._generalList
          : generalList // ignore: cast_nullable_to_non_nullable
              as List<GeneralNotificationModel>,
      applicationList: null == applicationList
          ? _value._applicationList
          : applicationList // ignore: cast_nullable_to_non_nullable
              as List<ApplicationNotificationModel>,
    ));
  }
}

/// @nodoc

class _$ReloadNotificationImpl
    with DiagnosticableTreeMixin
    implements _ReloadNotification {
  const _$ReloadNotificationImpl(
      {required final List<GeneralNotificationModel> generalList,
      required final List<ApplicationNotificationModel> applicationList})
      : _generalList = generalList,
        _applicationList = applicationList;

  final List<GeneralNotificationModel> _generalList;
  @override
  List<GeneralNotificationModel> get generalList {
    if (_generalList is EqualUnmodifiableListView) return _generalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_generalList);
  }

  final List<ApplicationNotificationModel> _applicationList;
  @override
  List<ApplicationNotificationModel> get applicationList {
    if (_applicationList is EqualUnmodifiableListView) return _applicationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicationList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.reloadNotification(generalList: $generalList, applicationList: $applicationList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationState.reloadNotification'))
      ..add(DiagnosticsProperty('generalList', generalList))
      ..add(DiagnosticsProperty('applicationList', applicationList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReloadNotificationImpl &&
            const DeepCollectionEquality()
                .equals(other._generalList, _generalList) &&
            const DeepCollectionEquality()
                .equals(other._applicationList, _applicationList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_generalList),
      const DeepCollectionEquality().hash(_applicationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReloadNotificationImplCopyWith<_$ReloadNotificationImpl> get copyWith =>
      __$$ReloadNotificationImplCopyWithImpl<_$ReloadNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)
        reloadNotification,
  }) {
    return reloadNotification(generalList, applicationList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)?
        reloadNotification,
  }) {
    return reloadNotification?.call(generalList, applicationList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<GeneralNotificationModel> generalList,
            List<ApplicationNotificationModel> applicationList)?
        reloadNotification,
    required TResult orElse(),
  }) {
    if (reloadNotification != null) {
      return reloadNotification(generalList, applicationList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ReloadNotification value) reloadNotification,
  }) {
    return reloadNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ReloadNotification value)? reloadNotification,
  }) {
    return reloadNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ReloadNotification value)? reloadNotification,
    required TResult orElse(),
  }) {
    if (reloadNotification != null) {
      return reloadNotification(this);
    }
    return orElse();
  }
}

abstract class _ReloadNotification implements NotificationState {
  const factory _ReloadNotification(
          {required final List<GeneralNotificationModel> generalList,
          required final List<ApplicationNotificationModel> applicationList}) =
      _$ReloadNotificationImpl;

  List<GeneralNotificationModel> get generalList;
  List<ApplicationNotificationModel> get applicationList;
  @JsonKey(ignore: true)
  _$$ReloadNotificationImplCopyWith<_$ReloadNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
