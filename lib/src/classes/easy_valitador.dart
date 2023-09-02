import 'package:intl/intl.dart';

abstract final class EasyValidator {
  ///validator for all text and string values
  static String? validator({String? value, required Pattern pattern, String? errorMessage}) {
    final notEmpty = value?.trim().isNotEmpty;
    if (notEmpty != null) {
      return hasMatch(value: value?.trim(), pattern: pattern)
          ? null
          : notEmpty
              ? (errorMessage ?? '')
              : "Cannot be empty";
    } else {
      return errorMessage ?? '';
    }
  }

  ///returns true if the value matches the pattern
  ///if [value] is null, it returns false
  ///[pattern] must not be null
  static bool hasMatch({String? value, required Pattern pattern}) => switch (value) {
        null => false,
        _ => RegExp(pattern.toString()).hasMatch(value),
      };

  ///validator for date pattern
  static String? dateValidator(String? value, {String? pattern = "yyyy-MM-dd", String? errorMessage}) {
    if (value != null) {
      return isDateStringValid(value, pattern: pattern) ? null : errorMessage ?? '';
    } else {
      return errorMessage ?? '';
    }
  }

  ///returns true if the date String matches the pattern
  ///if [pattern] null, the dateformat pattern defaults to "yyyy-MM-dd"
  static bool isDateStringValid(String? value, {String? pattern = "yyyy-MM-dd"}) {
    try {
      DateFormat(pattern).parseStrict(value ?? "");
      return true;
    } on FormatException {
      return false;
    }
  }
}
