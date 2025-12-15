import 'package:seed/core/helpers/helper_methods/app_regex.dart';

class Validators {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field Can\'t be empty';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!AppRegex.isEmailValid(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validateOptionalEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Email is optional
    } else if (!AppRegex.isEmailValid(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Please Enter Phone';
    } else if (!AppRegex.isPhoneNumberValid(value!)) {
      return 'Invalid phone format (e.g. 05XXXXXXXX)';
    }
    return null;
  }
}
