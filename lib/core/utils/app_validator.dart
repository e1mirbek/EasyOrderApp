import 'package:easy_order/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppValidator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailRequired;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return S.of(context).emailInvalid;
    }

    return null;
  }
}
