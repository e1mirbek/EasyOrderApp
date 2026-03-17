import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  /// Changes the application language based on the provided language code.
  ///
  /// Supported language codes:
  /// - 'ru' → Russian
  /// - 'en' → English
  /// - any other value → Kyrgyz (default)

  void changeLanguage(String type) {
    if (type == 'ru') {
      _appLocale = const Locale('ru');
    } else if (type == 'ky') {
      _appLocale = const Locale('ky');
    } else {
      _appLocale = const Locale('en');
    }
    notifyListeners();
  }
}
