import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/failures/storage_failure.dart';

part 'shared_states.freezed.dart';

@freezed
class SharedState with _$SharedState {
  const factory SharedState.initial() = _Initial;
  const factory SharedState.loading() = _Loading;
  const factory SharedState.uploading(double? progress) = _Uploading;
  const factory SharedState.storageError(StorageFailure e) = _StorageError;
  const factory SharedState.error(MainFailure e) = _Error;
  const factory SharedState.success() = _Success;
}

extension SharedStateX on SharedState {
  bool get isLoading => this is _Loading;
  bool get isUploading => this is _Uploading;
  bool get isStorageError => this is _StorageError;
  bool get isError => this is _Error;
  bool get isSuccess => this is _Success;
}
