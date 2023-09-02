import 'package:flutter_test/flutter_test.dart';

import 'package:easy_validator/easy_validator.dart';

void main() {
  test('adds one to input values', () {
    final calculator = EasyValidator.validator(
      value: "aa@gmailcom",
      pattern: EasyPatterns.email,
      errorMessage: "wrong",
    );
    expect(calculator, "wrong");
    expect(calculator?.isEmpty, false);
    expect(calculator?.isNotEmpty, true);
  });
}
