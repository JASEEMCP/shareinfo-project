// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilePickerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unsupportedMedia,
    required TResult Function(String fileName, String fileSize,
            Uint8List? fileByte, String filePath)
        filePicked,
    required TResult Function() sizeExceed,
    required TResult Function(
            String fileName, String fileSize, Uint8List? fileByte)
        edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unsupportedMedia,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult? Function()? sizeExceed,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unsupportedMedia,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult Function()? sizeExceed,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UnsupportedMedia value) unsupportedMedia,
    required TResult Function(_FilePicked value) filePicked,
    required TResult Function(_SizeExceed value) sizeExceed,
    required TResult Function(_Edited value) edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult? Function(_FilePicked value)? filePicked,
    TResult? Function(_SizeExceed value)? sizeExceed,
    TResult? Function(_Edited value)? edited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult Function(_FilePicked value)? filePicked,
    TResult Function(_SizeExceed value)? sizeExceed,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePickerStateCopyWith<$Res> {
  factory $FilePickerStateCopyWith(
          FilePickerState value, $Res Function(FilePickerState) then) =
      _$FilePickerStateCopyWithImpl<$Res, FilePickerState>;
}

/// @nodoc
class _$FilePickerStateCopyWithImpl<$Res, $Val extends FilePickerState>
    implements $FilePickerStateCopyWith<$Res> {
  _$FilePickerStateCopyWithImpl(this._value, this._then);

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
    extends _$FilePickerStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FilePickerState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FilePickerState.initial'));
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
    required TResult Function() unsupportedMedia,
    required TResult Function(String fileName, String fileSize,
            Uint8List? fileByte, String filePath)
        filePicked,
    required TResult Function() sizeExceed,
    required TResult Function(
            String fileName, String fileSize, Uint8List? fileByte)
        edited,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unsupportedMedia,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult? Function()? sizeExceed,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unsupportedMedia,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult Function()? sizeExceed,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
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
    required TResult Function(_UnsupportedMedia value) unsupportedMedia,
    required TResult Function(_FilePicked value) filePicked,
    required TResult Function(_SizeExceed value) sizeExceed,
    required TResult Function(_Edited value) edited,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult? Function(_FilePicked value)? filePicked,
    TResult? Function(_SizeExceed value)? sizeExceed,
    TResult? Function(_Edited value)? edited,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult Function(_FilePicked value)? filePicked,
    TResult Function(_SizeExceed value)? sizeExceed,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FilePickerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$UnsupportedMediaImplCopyWith<$Res> {
  factory _$$UnsupportedMediaImplCopyWith(_$UnsupportedMediaImpl value,
          $Res Function(_$UnsupportedMediaImpl) then) =
      __$$UnsupportedMediaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnsupportedMediaImplCopyWithImpl<$Res>
    extends _$FilePickerStateCopyWithImpl<$Res, _$UnsupportedMediaImpl>
    implements _$$UnsupportedMediaImplCopyWith<$Res> {
  __$$UnsupportedMediaImplCopyWithImpl(_$UnsupportedMediaImpl _value,
      $Res Function(_$UnsupportedMediaImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnsupportedMediaImpl
    with DiagnosticableTreeMixin
    implements _UnsupportedMedia {
  const _$UnsupportedMediaImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilePickerState.unsupportedMedia()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'FilePickerState.unsupportedMedia'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnsupportedMediaImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unsupportedMedia,
    required TResult Function(String fileName, String fileSize,
            Uint8List? fileByte, String filePath)
        filePicked,
    required TResult Function() sizeExceed,
    required TResult Function(
            String fileName, String fileSize, Uint8List? fileByte)
        edited,
  }) {
    return unsupportedMedia();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unsupportedMedia,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult? Function()? sizeExceed,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
  }) {
    return unsupportedMedia?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unsupportedMedia,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult Function()? sizeExceed,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
    required TResult orElse(),
  }) {
    if (unsupportedMedia != null) {
      return unsupportedMedia();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UnsupportedMedia value) unsupportedMedia,
    required TResult Function(_FilePicked value) filePicked,
    required TResult Function(_SizeExceed value) sizeExceed,
    required TResult Function(_Edited value) edited,
  }) {
    return unsupportedMedia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult? Function(_FilePicked value)? filePicked,
    TResult? Function(_SizeExceed value)? sizeExceed,
    TResult? Function(_Edited value)? edited,
  }) {
    return unsupportedMedia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult Function(_FilePicked value)? filePicked,
    TResult Function(_SizeExceed value)? sizeExceed,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (unsupportedMedia != null) {
      return unsupportedMedia(this);
    }
    return orElse();
  }
}

abstract class _UnsupportedMedia implements FilePickerState {
  const factory _UnsupportedMedia() = _$UnsupportedMediaImpl;
}

/// @nodoc
abstract class _$$FilePickedImplCopyWith<$Res> {
  factory _$$FilePickedImplCopyWith(
          _$FilePickedImpl value, $Res Function(_$FilePickedImpl) then) =
      __$$FilePickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fileName, String fileSize, Uint8List? fileByte, String filePath});
}

/// @nodoc
class __$$FilePickedImplCopyWithImpl<$Res>
    extends _$FilePickerStateCopyWithImpl<$Res, _$FilePickedImpl>
    implements _$$FilePickedImplCopyWith<$Res> {
  __$$FilePickedImplCopyWithImpl(
      _$FilePickedImpl _value, $Res Function(_$FilePickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileSize = null,
    Object? fileByte = freezed,
    Object? filePath = null,
  }) {
    return _then(_$FilePickedImpl(
      null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == fileByte
          ? _value.fileByte
          : fileByte // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilePickedImpl with DiagnosticableTreeMixin implements _FilePicked {
  const _$FilePickedImpl(
      this.fileName, this.fileSize, this.fileByte, this.filePath);

  @override
  final String fileName;
  @override
  final String fileSize;
  @override
  final Uint8List? fileByte;
  @override
  final String filePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilePickerState.filePicked(fileName: $fileName, fileSize: $fileSize, fileByte: $fileByte, filePath: $filePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilePickerState.filePicked'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileSize', fileSize))
      ..add(DiagnosticsProperty('fileByte', fileByte))
      ..add(DiagnosticsProperty('filePath', filePath));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePickedImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            const DeepCollectionEquality().equals(other.fileByte, fileByte) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, fileSize,
      const DeepCollectionEquality().hash(fileByte), filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePickedImplCopyWith<_$FilePickedImpl> get copyWith =>
      __$$FilePickedImplCopyWithImpl<_$FilePickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unsupportedMedia,
    required TResult Function(String fileName, String fileSize,
            Uint8List? fileByte, String filePath)
        filePicked,
    required TResult Function() sizeExceed,
    required TResult Function(
            String fileName, String fileSize, Uint8List? fileByte)
        edited,
  }) {
    return filePicked(fileName, fileSize, fileByte, filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unsupportedMedia,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult? Function()? sizeExceed,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
  }) {
    return filePicked?.call(fileName, fileSize, fileByte, filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unsupportedMedia,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult Function()? sizeExceed,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
    required TResult orElse(),
  }) {
    if (filePicked != null) {
      return filePicked(fileName, fileSize, fileByte, filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UnsupportedMedia value) unsupportedMedia,
    required TResult Function(_FilePicked value) filePicked,
    required TResult Function(_SizeExceed value) sizeExceed,
    required TResult Function(_Edited value) edited,
  }) {
    return filePicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult? Function(_FilePicked value)? filePicked,
    TResult? Function(_SizeExceed value)? sizeExceed,
    TResult? Function(_Edited value)? edited,
  }) {
    return filePicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult Function(_FilePicked value)? filePicked,
    TResult Function(_SizeExceed value)? sizeExceed,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (filePicked != null) {
      return filePicked(this);
    }
    return orElse();
  }
}

abstract class _FilePicked implements FilePickerState {
  const factory _FilePicked(final String fileName, final String fileSize,
      final Uint8List? fileByte, final String filePath) = _$FilePickedImpl;

  String get fileName;
  String get fileSize;
  Uint8List? get fileByte;
  String get filePath;
  @JsonKey(ignore: true)
  _$$FilePickedImplCopyWith<_$FilePickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SizeExceedImplCopyWith<$Res> {
  factory _$$SizeExceedImplCopyWith(
          _$SizeExceedImpl value, $Res Function(_$SizeExceedImpl) then) =
      __$$SizeExceedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SizeExceedImplCopyWithImpl<$Res>
    extends _$FilePickerStateCopyWithImpl<$Res, _$SizeExceedImpl>
    implements _$$SizeExceedImplCopyWith<$Res> {
  __$$SizeExceedImplCopyWithImpl(
      _$SizeExceedImpl _value, $Res Function(_$SizeExceedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SizeExceedImpl with DiagnosticableTreeMixin implements _SizeExceed {
  const _$SizeExceedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilePickerState.sizeExceed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'FilePickerState.sizeExceed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SizeExceedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unsupportedMedia,
    required TResult Function(String fileName, String fileSize,
            Uint8List? fileByte, String filePath)
        filePicked,
    required TResult Function() sizeExceed,
    required TResult Function(
            String fileName, String fileSize, Uint8List? fileByte)
        edited,
  }) {
    return sizeExceed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unsupportedMedia,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult? Function()? sizeExceed,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
  }) {
    return sizeExceed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unsupportedMedia,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult Function()? sizeExceed,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
    required TResult orElse(),
  }) {
    if (sizeExceed != null) {
      return sizeExceed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UnsupportedMedia value) unsupportedMedia,
    required TResult Function(_FilePicked value) filePicked,
    required TResult Function(_SizeExceed value) sizeExceed,
    required TResult Function(_Edited value) edited,
  }) {
    return sizeExceed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult? Function(_FilePicked value)? filePicked,
    TResult? Function(_SizeExceed value)? sizeExceed,
    TResult? Function(_Edited value)? edited,
  }) {
    return sizeExceed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult Function(_FilePicked value)? filePicked,
    TResult Function(_SizeExceed value)? sizeExceed,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (sizeExceed != null) {
      return sizeExceed(this);
    }
    return orElse();
  }
}

abstract class _SizeExceed implements FilePickerState {
  const factory _SizeExceed() = _$SizeExceedImpl;
}

/// @nodoc
abstract class _$$EditedImplCopyWith<$Res> {
  factory _$$EditedImplCopyWith(
          _$EditedImpl value, $Res Function(_$EditedImpl) then) =
      __$$EditedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileName, String fileSize, Uint8List? fileByte});
}

/// @nodoc
class __$$EditedImplCopyWithImpl<$Res>
    extends _$FilePickerStateCopyWithImpl<$Res, _$EditedImpl>
    implements _$$EditedImplCopyWith<$Res> {
  __$$EditedImplCopyWithImpl(
      _$EditedImpl _value, $Res Function(_$EditedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileSize = null,
    Object? fileByte = freezed,
  }) {
    return _then(_$EditedImpl(
      null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == fileByte
          ? _value.fileByte
          : fileByte // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$EditedImpl with DiagnosticableTreeMixin implements _Edited {
  const _$EditedImpl(this.fileName, this.fileSize, this.fileByte);

  @override
  final String fileName;
  @override
  final String fileSize;
  @override
  final Uint8List? fileByte;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilePickerState.edited(fileName: $fileName, fileSize: $fileSize, fileByte: $fileByte)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilePickerState.edited'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileSize', fileSize))
      ..add(DiagnosticsProperty('fileByte', fileByte));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditedImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            const DeepCollectionEquality().equals(other.fileByte, fileByte));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, fileSize,
      const DeepCollectionEquality().hash(fileByte));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditedImplCopyWith<_$EditedImpl> get copyWith =>
      __$$EditedImplCopyWithImpl<_$EditedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unsupportedMedia,
    required TResult Function(String fileName, String fileSize,
            Uint8List? fileByte, String filePath)
        filePicked,
    required TResult Function() sizeExceed,
    required TResult Function(
            String fileName, String fileSize, Uint8List? fileByte)
        edited,
  }) {
    return edited(fileName, fileSize, fileByte);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unsupportedMedia,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult? Function()? sizeExceed,
    TResult? Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
  }) {
    return edited?.call(fileName, fileSize, fileByte);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unsupportedMedia,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte,
            String filePath)?
        filePicked,
    TResult Function()? sizeExceed,
    TResult Function(String fileName, String fileSize, Uint8List? fileByte)?
        edited,
    required TResult orElse(),
  }) {
    if (edited != null) {
      return edited(fileName, fileSize, fileByte);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UnsupportedMedia value) unsupportedMedia,
    required TResult Function(_FilePicked value) filePicked,
    required TResult Function(_SizeExceed value) sizeExceed,
    required TResult Function(_Edited value) edited,
  }) {
    return edited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult? Function(_FilePicked value)? filePicked,
    TResult? Function(_SizeExceed value)? sizeExceed,
    TResult? Function(_Edited value)? edited,
  }) {
    return edited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UnsupportedMedia value)? unsupportedMedia,
    TResult Function(_FilePicked value)? filePicked,
    TResult Function(_SizeExceed value)? sizeExceed,
    TResult Function(_Edited value)? edited,
    required TResult orElse(),
  }) {
    if (edited != null) {
      return edited(this);
    }
    return orElse();
  }
}

abstract class _Edited implements FilePickerState {
  const factory _Edited(final String fileName, final String fileSize,
      final Uint8List? fileByte) = _$EditedImpl;

  String get fileName;
  String get fileSize;
  Uint8List? get fileByte;
  @JsonKey(ignore: true)
  _$$EditedImplCopyWith<_$EditedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
