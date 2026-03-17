import 'package:easy_order/logic/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LanguageProvider>();
    final currentLocale = provider.appLocale;
    return const Placeholder();
  }
}
