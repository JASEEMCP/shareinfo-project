// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:shareinfo/domain/common/auth_pref_file.dart';

mixin AuthLoadAndSaveMixin {
  late final _file = AuthPrefFile(fileName);

  String get fileName;
  Map<String, dynamic> toJson();
  void copyFromJson(Map<String, dynamic> data);

  ///Load data
  Future<void> load() async {
    final dataMap = await _file.load();
    try {
      copyFromJson(dataMap);
    } on Exception catch (e) {
      debugPrint('Error to load data: $e');
    }
  }

  ///Save data
  Future<void> save() async {
    try {
      await _file.save(toJson());
    } on Exception catch (e) {
      debugPrint('Error occurring while saving auth pref :$e');
    }
  }
}
