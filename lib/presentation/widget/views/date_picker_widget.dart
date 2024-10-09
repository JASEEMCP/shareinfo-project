import 'package:shareinfo/presentation/core/common_lib.dart';

Future<DateTime?> selectDate(
  BuildContext context, {
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) async {
  final DateTime? picked = await showDatePicker(
    keyboardType: TextInputType.datetime,
    initialEntryMode: DatePickerEntryMode.calendar,
    context: context,
    initialDatePickerMode: DatePickerMode.day,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: context.theme.shareinfoWhite,
          datePickerTheme: const DatePickerThemeData(
            surfaceTintColor: Colors.transparent,
          ),
        ),
        child: child!,
      );
    },
  );
  return picked;
}
