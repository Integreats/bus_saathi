import 'package:email_validator/email_validator.dart';
import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

/// Pre designed validators that can be used for validating text fields.
///
/// Methods in it returns String that contains error message iff certain conditions
/// don't match. Else, returns null if all checks gets passed.
class Validators {
  ///Method that validates passwords.
  static String? passwordValidator(String? password) {
    if (password!.length < 6) {
      return "Password should be of minimum 6 characters";
    }
    bool isPasswordValid =
        Fzregex.hasMatch(password, FzPattern.passwordNormal1);

    if (isPasswordValid == false) {
      return 'Password must contain at least 1 letter & 1 number';
    } else {
      return null;
    }
  }

  /// Method that validates confirm passwords.
  static String? confirmPasswordValidator(
      String? password, String? confirmPassword) {
    if (password! != confirmPassword!) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  /// Method that validates name.
  static String? nameValidator(String? name) {
    if (name!.isEmpty) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  /// Method that validates label.
  static String? blankFieldValidator(String? label) {
    if (label!.isEmpty) {
      return 'Field cannot be empty';
    } else {
      return null;
    }
  }

  /// Method that validates email.
  static String? emailValidator(String? email) {
    bool isEmailValid = EmailValidator.validate(email!, true);

    if (isEmailValid == false) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  ///Method that validates passwords.
  static String? passcodeValidator(String? password) {
    if (password!.isEmpty) {
      return 'Passcode cannot be empty';
    } else {
      return null;
    }
  }

  /// Method that validates confirm passwords.
  static String? confirmPasscodeValidator(
      String? password, String? confirmPassword) {
    if (password! != confirmPassword!) {
      return 'Passcodes do not match';
    } else {
      return null;
    }
  }
}
