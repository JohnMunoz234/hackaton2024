import 'package:formz/formz.dart';

enum PasswordValidationError { isEmpty, invalid }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (displayError == PasswordValidationError.invalid) {
      return 'Password cannot be empty';
    }
    return null;
  }

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.invalid;
    }
    return null;
  }
}
