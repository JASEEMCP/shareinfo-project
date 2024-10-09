import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_failure.freezed.dart';

@freezed
class StorageFailure with _$StorageFailure {
  const factory StorageFailure.uploadFailed() = _UploadFailed;
  const factory StorageFailure.deleteFailed() = _DeleteFailed;
  const factory StorageFailure.clientError() = _ClientError;
  const factory StorageFailure.serverError() = _ServerError;
  const factory StorageFailure.unableToLoad() = _UnableToLoad;
}

extension StorageFailureX on StorageFailure {
  String get errorDescription {
    return when(
      clientError: () => "Connection failed",
      serverError: () => "Something went wrong",
      uploadFailed: () => 'Unable to upload document',
      deleteFailed: () => 'Unable delete document',
      unableToLoad: () => 'Could not load attachment',
    );
  }
}
