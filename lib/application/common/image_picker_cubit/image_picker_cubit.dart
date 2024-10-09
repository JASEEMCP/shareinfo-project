import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
part 'image_picker_state.dart';
part 'image_picker_cubit.freezed.dart';

enum IdView { front, back }

@lazySingleton
class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(const ImagePickerState.initial());

  final ImagePicker picker = ImagePicker();
  Uint8List? frontView;
  Uint8List? backView;
  Uint8List? imageBytes;

  void loadImage(String? imageUrl) {
    if (imageUrl == null) {
      return emit(const ImagePickerState.initial());
    }

    /// Load network image if url is exist
    emit(ImagePickerState.imageLoaded(imageUrl));
  }

  ///Image picking from gallery
  Future<void> pickImageFromGallery() async {
    try {
      final galleryImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 10,
      );

      if (galleryImage == null) {
        return;
      }
      imageBytes = await galleryImage.readAsBytes();
      if (imageBytes == null) return;

      emit(const ImagePickerState.initial());
      emit(
        ImagePickerState.imagePicked(
          imageBytes,
          galleryImage.name.split('.').last,
        ),
      );
    } on PlatformException {
      return;
    }
  }

  ///Image picking using camera
  Future<void> takePicture() async {
    try {
      final galleryImage = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
      if (galleryImage == null) {
        return;
      }
      imageBytes = await galleryImage.readAsBytes();
      if (imageBytes == null) return;

      emit(const ImagePickerState.initial());
      emit(
        ImagePickerState.imagePicked(
          imageBytes,
          galleryImage.name.split('.').last,
        ),
      );
    } on PlatformException {
      return;
    }
  }

  //Reset to initial state
  Future<void> rollbackToInitialState() async {
    imageBytes = null;
    frontView = null;
    backView = null;
    emit(const ImagePickerState.initial());
  }

  //Clear image
  Future<void> removePicture() async {
    imageBytes = null;

    //emit(const ImagePickerState.initial());
    emit(const ImagePickerState.imageRemoved());
  }

  ///Image picking from gallery
  Future<void> pickStudentId(IdView view) async {
    try {
      final galleryImage = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
        allowMultiple: false,
      );

      /// Handle image when user didn't pick image
      if (galleryImage == null) {
        if (view == IdView.front) {
          frontView = null;
          return;
        } else {
          backView = null;
          return;
        }
      }
      final imageAsByte = galleryImage.files.single.bytes;
      //Checking file size exceeding 3 MB
      // if (imageAsByte!.length > 3100000) {
      //   emit(const ImagePickerState.initial());
      //   emit(const ImagePickerState.sizeExceed());
      //   return;
      // }
      if (view == IdView.front) {
        frontView = imageAsByte;
        emit(const ImagePickerState.initial());
        return emit(ImagePickerState.frontImage(
            frontView!, galleryImage.files.single.name));
      } else {
        backView = imageAsByte;
        emit(const ImagePickerState.initial());
        emit(ImagePickerState.backImage(
            backView!, galleryImage.files.single.name));
      }
    } on PlatformException {
      return;
    }
  }
}
