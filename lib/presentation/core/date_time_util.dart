import 'package:intl/intl.dart';

String? validateDateFormat(String? date) {
  if (date == null) {
    return "Invalid format"; // Return "Invalid" if the input is null
  }
  if (date.isEmpty) {
    return "Required";
  }

  // Ensure the date string is in the correct format
  if (!RegExp(r"^\d{1,2}/\d{1,2}/\d{4}$").hasMatch(date)) {
    return "Invalid format"; // Return "Invalid" if the format is incorrect
  }

  try {
    // Define the expected date format
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    // Parse the date string to ensure it matches the format strictly
    dateFormat.parseStrict(date);
    return null;
  } catch (e) {
    // If parsing fails, the date format is invalid
    return "Invalid format";
  }
}

String formatDateRange(String startDateString, String? endDateString) {
  try {
    final DateFormat inputFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat monthYearFormatter = DateFormat('MMMM yyyy');

    // Parse the input strings to DateTime objects
    DateTime startDate = inputFormatter.parse(startDateString);
    if (endDateString == null) {
      String formattedStartDate = monthYearFormatter.format(startDate);
      return '$formattedStartDate - Present';
    }
    DateTime endDate = inputFormatter.parse(endDateString);
    String formattedStartDate = monthYearFormatter.format(startDate);
    String formattedEndDate = monthYearFormatter.format(endDate);

    Duration difference = endDate.difference(startDate);

    int years = difference.inDays ~/ 365;
    int remainingDays = difference.inDays % 365;
    int months = remainingDays ~/ 30;
    int days = remainingDays % 30;

    String breakdown;
    if (years > 0) {
      breakdown = '$years ${years > 1 ? "years" : "year"}';
    } else if (months > 0) {
      breakdown = '$months ${months > 1 ? "months" : "month"}';
    } else {
      breakdown = '$days ${days > 1 ? "days" : "day"}';
    }

    return '$formattedStartDate - $formattedEndDate ($breakdown)';
  } catch (_) {
    return '';
  }
}

String? convertDate(String? date, {bool toReverse = false}) {
  if (date == null) {
    return null;
  }
  try {
    if (toReverse) {
      // Convert from DD/MM/YYYY to YYYY-MM-DD
      DateFormat inputFormat = DateFormat('d/M/yyyy');
      DateFormat outputFormat = DateFormat('yyyy-MM-dd');
      DateTime parsedDate = inputFormat.parseStrict(date);
      return outputFormat.format(parsedDate);
    } else {
      // Convert from YYYY-MM-DD to DD/MM/YYYY
      DateFormat inputFormat = DateFormat('yyyy-M-d');
      DateFormat outputFormat = DateFormat('dd/MM/yyyy');
      DateTime parsedDate = inputFormat.parseStrict(date);
      return outputFormat.format(parsedDate);
    }
  } catch (e) {
    // Return empty string if date format is invalid
    return null;
  }
}

DateTime? convertToDateTime(String? date) {
  if (date == null) {
    return null;
  }
  try {
    // Define the input format that matches the date string
    DateFormat inputFormat = DateFormat('yyyy-M-d');
    // Parse the date string into a DateTime object
    DateTime parsedDate = inputFormat.parseStrict(date);
    return parsedDate;
  } catch (e) {
    // Return null if the date format is invalid
    return null;
  }
}
