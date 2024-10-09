part of 'file_picker_cubit.dart';

@freezed
class FilePickerState with _$FilePickerState {
  const factory FilePickerState.initial() = _Initial;
  const factory FilePickerState.unsupportedMedia() = _UnsupportedMedia;

  const factory FilePickerState.filePicked(String fileName, String fileSize,
      Uint8List? fileByte, String filePath) = _FilePicked;
  const factory FilePickerState.sizeExceed() = _SizeExceed;
  const factory FilePickerState.edited(
      String fileName, String fileSize, Uint8List? fileByte) = _Edited;
}

extension FilePickerStateX on FilePickerState {
  bool get isEdited => this is _Edited;
  bool get isSizeExceed => this is _SizeExceed;
  bool get isUnsupportedMedia => this is _UnsupportedMedia;
}
