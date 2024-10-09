import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shareinfo/domain/common/api/dio_client.dart';

class Date {
  ///Date  String
  ///Default date separator is '/'
  final String? dateStr;
  //Date time instance
  final DateTime? date;

  ///Returning year difference
  final int? count;
  final String? countWithText;

  ///Date format 'April/2023'
  factory Date.mmmmy(String? date) {
    if (date == null) {
      return const Date._(dateStr: null, date: null);
    }
    date = date.replaceAll(r'-', r'/');
    DateTime newDate = DateFormat('y/MM/dd').parse(date);
    date = '${DateFormat('MMMM').format(newDate)}/${newDate.year}';
    return Date._(dateStr: date, date: newDate);
  }

  ///Date format '2023/Apr'
  factory Date.mmy(String? date) {
    if (date == null) {
      return const Date._(dateStr: null, date: null);
    }
    date = date.replaceAll(r'-', r'/');
    DateTime newDate = DateFormat('y/MM/dd').parse(date);
    date = '${DateFormat('MMM').format(newDate)}/${newDate.year}';
    return Date._(dateStr: date, date: newDate);
  }

  ///Date format '2023/12/23'
  factory Date.ymmdd(String? date) {
    if (date == null) {
      return const Date._(dateStr: null, date: null);
    }
    date = date.replaceAll(r'-', r'/');
    DateTime newDate = DateFormat('y/MM/dd').parse(date);
    //newDate = DateFormat('y/mm/dd').parse(date);
    date = '${newDate.year}/${newDate.month}/${newDate.day}';
    return Date._(dateStr: date, date: newDate);
  }

  ///Date format '12/01/2023'
  factory Date.ddmmy(String? date) {
    if (date == null) {
      return const Date._(dateStr: null, date: null);
    }
    date = date.replaceAll(r'-', r'/');
    DateTime newDate = DateFormat('y/MM/dd').parse(date);
    //newDate = DateFormat('y/MM/dd').parse(date);
    date = '${newDate.day}/${newDate.month}/${newDate.year}';
    return Date._(dateStr: date, date: newDate);
  }
  factory Date.ddmmyReverse(String? date) {
    if (date == null) {
      return const Date._(dateStr: null, date: null);
    }
    date = date.replaceAll(r'-', r'/');
    DateTime newDate = DateFormat('dd/MM/y').parse(date);
    //newDate = DateFormat('dd/MM/y').parse(date);
    date = '${newDate.year}/${newDate.month}/${newDate.day}';
    return Date._(dateStr: date, date: newDate);
  }

  factory Date.difference(String? from, String? to) {
    if (from == null || to == null) {
      return const Date._(dateStr: null, date: null);
    }
    from = from.replaceAll(r'-', r'/');
    to = to.replaceAll(r'-', r'/');
    DateTime newFrom = DateFormat('y/MM/dd').parse(from);
    DateTime newTo = DateFormat('y/MM/dd').parse(to);
    final year = daysBetween(newFrom, newTo);
    int yearDifference = newTo.difference(newFrom).inDays ~/ 30.abs();
    if (year < 1) {
      if (yearDifference < 1) {
        yearDifference = newTo.difference(newFrom).inDays;
        return Date._(
            dateStr: null,
            count: yearDifference,
            countWithText: '${yearDifference.abs()} Days');
      }
      return Date._(
          dateStr: null,
          count: yearDifference,
          countWithText: '${yearDifference.abs()} Months');
    }

    return Date._(
        dateStr: null, count: year, countWithText: '${year.abs()} Years');
  }
  @override
  String toString() {
    return dateStr.toString();
  }

  const Date._(
      {required this.dateStr, this.date, this.count, this.countWithText});

  //Replace '/' to  '-'
  ///Default = '/'
  String? get toDashSeparator {
    if (dateStr == null) {
      return null;
    }
    String date = dateStr!;
    if (date.contains('/')) {
      date = date.replaceAll(r'/', r'-');
    } else if (date.contains(' ')) {
      date = date.replaceAll(r' ', r'-');
    }

    return date.toString();
  }

  //Replace '/' to  ' '
  ///Default = '/'
  String? get toBlankSeparator {
    if (dateStr == null) {
      return 'N/A';
    }
    String date = dateStr!;
    if (date.contains('/')) {
      date = date.replaceAll(r'/', r' ');
    } else if (date.contains('-')) {
      date = date.replaceAll(r' ', r' ');
    }

    return date.toString();
  }

  ///year difference
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    int year = (to.difference(from).inDays ~/ 365).toInt().abs();

    return year;
  }
}

/*Extension and String  */

extension ControllerListX on List<TextEditingController> {
  bool isAllEmpty() {
    return every((controller) => controller.text.trim().isEmpty);
  }

  bool isAnyOneEmpty() {
    return any((controller) => controller.text.trim().isEmpty);
  }

  bool allSame() {
    return every((controller) => controller.text.trim() == this[0].text.trim());
  }

  bool isItemEmpty(int index) {
    if (index >= 0 && index < length) {
      return this[index].text.trim().isEmpty;
    }
    return false;
  }

  bool isValidEmailAt(int index) {
    if (index >= 0 && index < length) {
      final nameRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}");
      return !nameRegExp.hasMatch(this[index].text.trim());
    }
    return false;
  }

  bool isValidPhoneAt(int index) {
    if (index >= 0 && index < length) {
      final phoneRegExp = RegExp(r"^[0-9]{10}$");

      return !phoneRegExp.hasMatch(this[index].text.trim());
    }
    return false;
  }

  bool isValidPasswordAt(int index) {
    if (index >= 0 && index < length) {
      final passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      return !passwordRegExp.hasMatch(this[index].text.trim());
    }
    return false;
  }

  String joinTextController() {
    return map((e) => e.text).join('').trim();
  }
}

bool isValidUrl(String url) {
  final RegExp urlRegExp = RegExp(
      r"^(https?):\/\/(?:www\.)?((?!-)[A-Za-z0-9-]{1,63}(?<!-)\.)+([A-Za-z]{2,63}|[A-Za-z]{1,5}\.[A-Za-z]{2,63})(?::\d{1,5})?(?:\/[^\s]*)?$");

  // Check if the TLD is not a single character without a proper domain name
  if (urlRegExp.hasMatch(url)) {
    final uri = Uri.parse(url);
    final tld = uri.host.split('.').last;
    if (tld.length == 1 && uri.host.split('.').length == 1) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

///Check date is not null
String? dateNotEmpty(String? date) {
  if (date == null) {
    return 'Date attribute is Required';
  }
  return null;
}

GlobalKey<FormState> generateFormKey() {
  return GlobalKey<FormState>();
}

TextEditingController generateTextController() {
  return TextEditingController();
}

//form validator
bool isEmptyForm(String? value) {
  if (value != null && value.trim().isEmpty) {
    return true;
  }
  return false;
}

//Update and create method determine with id passing in a screen
DioMethodType requestTypeHandleWithId(int? id) {
  if (id != null) return DioMethodType.put;
  return DioMethodType.post;
}

///validating number
bool isInteger(String number) {
  final numberRegExp = RegExp(r'^[0-9]+$');
  if (numberRegExp.hasMatch(number)) {
    return true;
  } else {
    return false;
  }
}

///validating number
bool isDouble(String number) {
  final numberRegExp = RegExp(r'^[0-9]*(?:\.[0-9]+)?$');
  if (numberRegExp.hasMatch(number)) {
    return true;
  } else {
    return false;
  }
}

String? handleNullString(TextEditingController controller) {
  if (controller.text.trim().isEmpty) {
    return null;
  }
  return controller.text.trim();
}

String? handleEmptyString(TextEditingController controller,
    {bool toUpper = false, bool isUrl = false}) {
  if (controller.text.trim().isEmpty) {
    return null;
  } else {
    if (isUrl) {
      return controller.text.trim().toLowerCase();
    }
    if (toUpper) {
      return controller.text.trim().toUpperCase();
    }
    return controller.text.trim().toTitleCase();
  }
}

String? handleNullInteger(int? num) {
  if (num == null) {
    return null;
  } else {
    return num.toString();
  }
}

String? getSalaryToLpa(int? salary) {
  if (salary == null) return 'N/A';
  return ((salary) * 0.00012).toStringAsFixed(2);
}

String handleIntegerNullString(int? num) {
  if (num == null) {
    return '';
  } else {
    return num.toString();
  }
}

String handleDoubleNullString(double? num) {
  if (num == null) {
    return '';
  } else {
    return num.toString();
  }
}

int? stringToInt(String? num) {
  if (num == null || num.trim() == '') {
    return null;
  } else {
    return int.parse(num);
  }
}

double? stringToDouble(String? num) {
  if (num == null || num.trim() == '') {
    return null;
  } else {
    return double.parse(num);
  }
}

///validating postal code
bool isValidPincode(String pincode) {
  final numberRegExp = RegExp(r"^[0-9]{6}$");
  if (numberRegExp.hasMatch(pincode)) {
    return true;
  } else {
    return false;
  }
}

extension FormErrorMsg on String {
  //String get trimToString => trim().toString();
  String get fieldIsRequired => 'This field is Required';
  String get fieldNotEmpty => 'Above field are required';
  String get emailNotEmpty => 'Email is required';
  String get phoneNumberNotEmpty => 'Phone number is required';
  String get passwordNotEmpty => 'Password is required';
  String get validEmail => 'Enter valid email address';
  String get validPhoneNumber => 'Enter valid Phone number';
  String get validPassword =>
      'Ensure your password is 8 characters long, with a mix of uppercase,lowercase, and at least one special character';

  String get isMismatch =>
      'Mismatch detected. Verify that both passwords are entered correctly';
}

extension StringStyling on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

Future<String> getFileSize(int? fileByte) async {
  if (fileByte == null) return 'N/A';

  if (fileByte <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB"];
  var i = (log(fileByte) / log(1024)).floor();
  return '${(fileByte / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
}

Future<dynamic> getFileSizeInByte(File? document) async {
  if (document == null) return 0;
  var file = document;
  int bytes = await file.length();
  if (bytes <= 0) return 0;

  return bytes;
}
