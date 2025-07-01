

import 'package:shop_ecommerce/generated/l10n.dart';

abstract class ValidatorFormField {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validateName;
    }
    if (value.length < 3) {
      return S.current.validateName2;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validatePhoneEmpty;
    }
    String cleanedValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanedValue)) {
      return S.current.validatePhoneDigitsOnly;
    }
    if (cleanedValue.length < 7 || cleanedValue.length > 15) {
      return S.current.validatePhoneLength;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.validateEmailEmpty;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return S.current.validateEmailInvalid;
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return S.current.validatePassword;
    }
    if (value.length < 5) {
      return S.current.validatePassword2;
    }
    return null;
  }

  static String? validateConfirmPassword(value) {
    if (value == null || value.isEmpty) {
      return S.current.validateConfirmPassword;
    }
    if (value.length < 5) {
      return S.current.validateConfirmPawword2;
    }
    return null;
  }
}
