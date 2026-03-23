import 'package:easy_order/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppValidator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final _passwordValidate = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final _nameValidate = RegExp(r"^[a-zA-Zа-яА-ЯёЁ\s'-]+$");

  // email validate

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailRequired;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return S.of(context).emailInvalid;
    }

    return null;
  }

  // password validate

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordRequired;
    }

    if (!_passwordValidate.hasMatch(value)) {
      return S.of(context).passwordTooShort;
    }

    return null;
  }

  // email validate

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).fullNameRequired;
    }

    if (value.trim().length < 2) {
      return S.of(context).fullNameTooShort;
    }

    if (!_nameValidate.hasMatch(value)) {
      return S.of(context).fullNameTooShort;
    }
    return null;
  }
}
