import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/common/azure_storage_service.dart';
import 'package:shareinfo/domain/common/azure_storage_util.dart';
import 'package:shareinfo/domain/failures/storage_failure.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'dart:typed_data';

@LazySingleton(as: AzureStorageService)
class AzureStorageRepo implements AzureStorageService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Env().azureStorageUrl,
      connectTimeout: const Duration(seconds: 110),
      receiveTimeout: const Duration(seconds: 110),
      sendTimeout: const Duration(seconds: 110),
    ),
  );

  @override
  Future<Either<StorageFailure, String>> deleteDocument(
    String deletePath,
    String fileName,
  ) async {
    try {
      Options options = Options(
        headers: {
          'x-ms-blob-type': 'BlockBlob',
        },
        sendTimeout:
            const Duration(seconds: 110), // Set timeout directly in options
        receiveTimeout: const Duration(seconds: 110),
      );

      /// Create SAS signature with write permission 'd'

      String blobUrl = generateSASUrl(
        deletePath,
        fileName,
        containerName: BlobDir.candidate,
        hour: 1,
        signedPermissions: 'd',
      );

      // Delete  file using DELETE request
      Response response = await dio.delete(
        blobUrl,
        options: options,
      );

      if (response.statusCode == 202) {
        /// Return deleted path
        return Right(deletePath);
      }
      return const Left(StorageFailure.clientError());
    } on DioException catch (_) {
      return const Left(StorageFailure.serverError());
    }
  }

  @override
  Future<Either<StorageFailure, String>> uploadDocument(
    Uint8List? fileByte,
    String uploadPath,
    String fileName,
    Function(int, int) onSendProgress,
  ) async {
    try {
      if (fileByte == null) {
        return const Left(StorageFailure.unableToLoad());
      }
      Options options = Options(
        headers: {
          'x-ms-blob-type': 'BlockBlob',
          'Content-Type': 'application/pdf',
          'Content-Length': fileByte.length,
        },
        sendTimeout:
            const Duration(seconds: 110), // Set timeout directly in options
        receiveTimeout: const Duration(seconds: 110),
      );

      String blobUrl = generateSASUrl(
        uploadPath,
        fileName,
        containerName: BlobDir.candidate,
        hour: 1,
        signedPermissions: 'w',
      );

      // Upload the file using PUT request
      Response response = await dio.put(
        blobUrl,
        data: Stream.fromIterable(fileByte.map((e) => [e])),
        options: options,
        onSendProgress: onSendProgress,
      );

      if (response.statusCode == 201) {
        /// Return uploaded document path
        return Right('$uploadPath$fileName');
      }

      return const Left(StorageFailure.clientError());
    } on DioException catch (_) {
      return const Left(StorageFailure.serverError());
    }
  }

  @override
  Future<Either<StorageFailure, String>> uploadImage(
    Uint8List? imageBytes,
    String uploadPath,
    String imageName,
    String mediaType,
    Function(int, int) onSendProgress,
  ) async {
    try {
      if (imageBytes == null) {
        return const Left(StorageFailure.unableToLoad());
      }
      Options options = Options(
        headers: {
          'x-ms-blob-type': 'BlockBlob',
          'Content-Type': 'application/octet-stream',
          'Content-Length': imageBytes.length,
        },
        sendTimeout:
            const Duration(seconds: 110), // Set timeout directly in options
        receiveTimeout: const Duration(seconds: 110),
      );

      String blobUrl = generateSASUrl(
        uploadPath,
        imageName,
        containerName: BlobDir.candidate,
        hour: 1,
        signedPermissions: 'w',
      );

      // Upload the file using PUT request
      Response response = await dio.put(
        blobUrl,
        data: Stream.fromIterable(imageBytes.map((e) => [e])),
        options: options,
        onSendProgress: onSendProgress,
      );

      if (response.statusCode == 201) {
        /// Return uploaded document path
        return Right('$uploadPath$imageName');
      }
      return const Left(StorageFailure.clientError());
    } on DioException catch (_) {
      return const Left(StorageFailure.serverError());
    }
  }

  @override
  Future<Either<StorageFailure, String>> deleteImage(
      String deletePath, String imageName) async {
    try {
      Options options = Options(
        headers: {
          'x-ms-blob-type': 'BlockBlob',
        },
      );

      /// Create SAS signature with write permission 'd'

      String blobUrl = generateSASUrl(
        deletePath,
        imageName,
        containerName: BlobDir.candidate,
        hour: 1,
        signedPermissions: 'd',
      );

      // Delete  file using DELETE request
      Response response = await dio.delete(
        blobUrl,
        options: options,
      );

      if (response.statusCode == 202) {
        /// Return deleted path
        return Right(deletePath);
      }
      return const Left(StorageFailure.clientError());
    } on DioException catch (_) {
      return const Left(StorageFailure.serverError());
    }
  }
}
