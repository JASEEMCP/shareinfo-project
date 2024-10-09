// ignore: avoid_web_libraries_in_flutter
//import 'dart:html' as html;

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:shareinfo/core/string_util.dart';
import 'package:shareinfo/domain/common/azure_storage_util.dart';
import 'package:url_launcher/url_launcher.dart';
part 'file_picker_state.dart';
part 'file_picker_cubit.freezed.dart';

@LazySingleton()
class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(const FilePickerState.initial());

  Uint8List? fileBytes;
  String fileSize = '';
  String fileName = 'no-label';
  File? document;

  ///Load file from local directory
  Future<void> browseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], withData: true);

    if (result != null) {
      var file = result.files.first;
      document = File(result.files.single.path!.replaceAll(r'\', r'/'));
      if (file.name.split('.').last.toLowerCase() != 'pdf') {
        emit(const FilePickerState.initial());
        emit(const FilePickerState.unsupportedMedia());
        return;
      }
      //Checking file size exceeding 3 MB
      if (file.bytes!.length > 3100000) {
        fileSize = '';
        emit(const FilePickerState.initial());
        emit(const FilePickerState.sizeExceed());
        return;
      }

      /// File bytes converted into different size format
      fileSize = await getFileSize(file.bytes?.length);
      fileName = file.name;
      // Assign loaded file bytes
      fileBytes = file.bytes;
      emit(const FilePickerState.initial());
      emit(FilePickerState.edited(file.name, fileSize, file.bytes!));
      return;
    }

    fileBytes = null;
    fileSize = '';
    fileName = 'no-label';
    emit(const FilePickerState.initial());
  }

  Future<void> removeFile() async {
    fileBytes = null;
    fileSize = '';
    fileName = 'no-label';
    emit(const FilePickerState.initial());
  }

  Future<void> viewFileMobile(File? doc) async {
    if (doc != null) {
      await OpenFile.open(doc.path);
      return;
    }
  }

  Future<void> viewFile(Uint8List? fileBytes, String fileName,
      {String? blobPath}) async {
    /// View file that loaded in local directory
    if (fileBytes != null && fileBytes.isNotEmpty) {
      // if(Platform.isAndroid){
      viewFileMobile(document);
      // }
      // final blob = html.Blob([fileBytes], 'application/pdf');

      // /// Create url of locally opened file
      // final url = html.Url.createObjectUrlFromBlob(blob);
      // await launchUrl(Uri.parse(url));
    } else {
      /// Generate SAS token open uploaded file
      final sasUrl = generateSASUrl(
        blobPath ?? '',
        fileName,
        containerName: BlobDir.candidate,
        hour: 1,
        signedPermissions: 'r',
      );
      await launchUrl(Uri.parse(sasUrl));
    }
  }

  /// Load file initially
  Future<void> loadFile(String? fileName, String? filePath) async {
    if (filePath == null) {
      fileBytes = null;
      fileName = 'no-label';
      return emit(const FilePickerState.initial());
    }
    fileBytes = Uint8List.fromList([]);
    emit(const FilePickerState.initial());
    emit(
      FilePickerState.filePicked(
        fileName ?? 'no-label',
        '',
        fileBytes,
        filePath.split('/').last,
      ),
    );
  }
}
