part of 'image_picker_cubit.dart';

@freezed
class ImagePickerState with _$ImagePickerState {
  const factory ImagePickerState.initial() = _Initial;

  const factory ImagePickerState.imageLoaded(String? imageUrl) = _imageLoaded;
  const factory ImagePickerState.frontImage(
      Uint8List? imageByte, String mediaType) = _FrontImage;
  const factory ImagePickerState.backImage(
      Uint8List? imageByte, String mediaType) = _BackImage;
  const factory ImagePickerState.imagePicked(
      Uint8List? imageByte, String mediaType) = _ImagePicked;
  const factory ImagePickerState.imageRemoved() = _ImageRemoved;

  const factory ImagePickerState.sizeExceed() = _SizeExceed;
}

extension ImagePickerStateX on ImagePickerState {
  bool get isEdited => this is _ImagePicked;
  bool get isDeleted => this is _ImageRemoved;
}
