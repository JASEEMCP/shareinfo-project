import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/storage_failure.dart';
import 'dart:typed_data';

abstract class AzureStorageService {
  Future<Either<StorageFailure, String>> uploadDocument(
    Uint8List? file,
    String uploadPath,
    String fileName,
    Function(int, int) onSendProgress,
  );

  Future<Either<StorageFailure, String>> deleteDocument(
    String uploadPath,
    String fileName,
  );

  Future<Either<StorageFailure, String>> uploadImage(
    Uint8List? imageBytes,
    String uploadPath,
    String imageName,
    String mediaType,
    Function(int, int) onSendProgress,
  );

  Future<Either<StorageFailure, String>> deleteImage(
    String deletePath,
    String imageName,
  );
}
