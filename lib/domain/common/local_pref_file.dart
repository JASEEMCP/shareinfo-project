import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalPrefFile {
  final String fileName;
  LocalPrefFile(this.fileName);

  ///Load physical data from storage
  Future<Map<String, dynamic>> load() async {
    final data = (await SharedPreferences.getInstance()).getString(fileName);

    return Map<String, dynamic>.from(jsonDecode(data ?? '{}'));
  }

  ///Save data into local storage
  Future<void> save(Map<String, dynamic> data) async {
    await (await SharedPreferences.getInstance())
        .setString(fileName, jsonEncode(data));
  }
}
