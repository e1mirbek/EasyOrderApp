import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalController extends Notifier<Locale> {
  @override
  Locale build() {
    // Начальное состояние
    return const Locale('en');
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}
