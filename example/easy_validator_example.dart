import 'package:easy_validator/easy_validator.dart';

void main() {
  // invalid email
  const wrongEmail = "emailusername.gmail.com";

  // valid format email
  const validEmail = "emailusername@gmail.com";

  final wrongEmailValid = EasyValidator.validator(
    value: wrongEmail,
    pattern: EasyPatterns.email,
    errorMessage: "wrong email",
  );
  final isEmail1Valid = EasyValidator.hasMatch(
    value: wrongEmailValid,
    pattern: EasyPatterns.email,
  );

  final validEmailValid = EasyValidator.validator(
    value: validEmail,
    pattern: EasyPatterns.email,
    errorMessage: "wrong email",
  );
  final isEmail2Valid = EasyValidator.hasMatch(
    value: validEmail,
    pattern: EasyPatterns.email,
  );

  print(wrongEmailValid); //wrong email
  print("$wrongEmail: $isEmail1Valid"); // emailusername.gmail.com: false

  print(validEmailValid); //null
  print("$validEmail: $isEmail2Valid"); // emailusernamegmail.com: true
}
