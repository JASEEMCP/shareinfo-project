import 'package:flutter/cupertino.dart';
import 'package:shareinfo/domain/common/local_pref_file.dart';
import 'package:shareinfo/domain/common/throttler.dart';

mixin ThrottleLoadAndSaveMixin {
  late final _file = LocalPrefFile(fileName);
  final _throttle = Throttler(const Duration(seconds: 2));

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
      debugPrint('Saving error :$e');
    }
  }

  Future<void> scheduleSave() async => _throttle.call(save);
}
