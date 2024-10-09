import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shareinfo/domain/common/load_and_save_interface.dart';

@LazySingleton()
class SettingsLogic with ThrottleLoadAndSaveMixin {
  late final hasCompletedOnboarding = ValueNotifier<bool>(false)
    ..addListener(scheduleSave);
  late final rememberMe = ValueNotifier<bool>(false)..addListener(scheduleSave);
  late final update = ValueNotifier<bool>(false);
  late final sasToken = ValueNotifier<String?>(null)..addListener(scheduleSave);
  late final enableNotification = ValueNotifier<bool>(true)
    ..addListener(scheduleSave);
  late final blobExpireDate = ValueNotifier<String?>(DateTime.now().toString())
    ..addListener(scheduleSave);

  final version = ValueNotifier<String>('1.0.1');

  @override
  void copyFromJson(Map<String, dynamic> data) {
    hasCompletedOnboarding.value = data['hasCompletedOnboarding'] ?? false;
    version.value = data['version'] ?? '1.0.1';
    rememberMe.value = data['remember_me'] ?? false;
    update.value = data['update'] ?? false;
    sasToken.value = data['sas_token'] ?? '';
    // enableNotification.value = data['notification'] ?? true;
    blobExpireDate.value =
        data['blob_expire_date'] ?? DateTime.now().toString();
  }

  @override
  String get fileName => 'settings.dat';

  @override
  Map<String, dynamic> toJson() {
    return {
      'hasCompletedOnboarding': hasCompletedOnboarding.value,
      'version': version.value,
      'remember_me': rememberMe.value,
      'update': update.value,
      // 'notification': enableNotification.value,
      'sas_token': sasToken.value,
      'blob_expire_date': blobExpireDate.value,
    };
  }

  Future<void> clearData() async {
    ///Clear data
    await (await SharedPreferences.getInstance()).remove(fileName);
  }
}
