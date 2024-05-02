import 'package:formz/formz.dart';

enum EmailValidationError { isEmpty, invalid }

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (displayError == EmailValidationError.isEmpty) {
      return 'Email cannot be empty';
    }
    return null;
  }

  @override
  validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailValidationError.isEmpty;
    }

    return null;
  }
}
