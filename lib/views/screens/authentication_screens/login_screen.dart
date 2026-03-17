// ignore: unused_import
import 'dart:developer' as dev;

import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/logic/providers/language_provider.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/account_query_row.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/welcome_Illustration.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/header_section.dart';
import 'package:easy_order/views/widgets/custom_button.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LanguageProvider>();
    final currentLocale = provider.appLocale;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.screenPadding),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PopupMenuButton<Locale>(
                              initialValue: currentLocale,
                              onSelected: (Locale locale) {
                                provider.setLanguage(locale);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonBlue,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.language,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      S.of(context).languageName,
                                      style: AppTextStyles.buttontitle,
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              itemBuilder: (context) => [
                                _buildLanguageItem(
                                  locale: const Locale('en'),
                                  title: 'English',
                                  icon: AppAssets.isFlagEn,
                                  isSelected:
                                      currentLocale.languageCode == 'en',
                                ),
                                _buildLanguageItem(
                                  locale: const Locale('ru'),
                                  title: 'Русский',
                                  icon: AppAssets.isFlagRu,
                                  isSelected:
                                      currentLocale.languageCode == 'ru',
                                ),
                                _buildLanguageItem(
                                  locale: const Locale('ky'),
                                  title: 'Кыргызсча',
                                  icon: AppAssets.isFlagKy,
                                  isSelected:
                                      currentLocale.languageCode == 'ky',
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.spaceMedium),
                        HeaderSection(
                          loginTitle: S.of(context).loginSubtitle,
                          loginSubtitle: S.of(context).loginSubtitle,
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),
                        const WelcomeIllustration(
                          welcomeImgIllu: AppAssets.welcomeIllu,
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),

                        /// email block
                        LabeledTextField(
                          label: S.of(context).emailLabel,
                          hintText: S.of(context).emailHint,
                          prefixIcon: AppAssets.emaiIcon,
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),

                        /// password block
                        LabeledTextField(
                          label: S.of(context).passwordLabel,
                          hintText: S.of(context).passwordHint,
                          prefixIcon: AppAssets.passwordIcon,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                          obscureText: _isObscure,
                        ),
                        const SizedBox(height: AppSizes.spaceMedium),

                        /// sing in block
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          child: CustomButton(
                            onPressed: () => dev.log('open the page'),
                            title: S.of(context).signUp,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),

                        /// register block
                        AccountQueryRow(
                          text: S.of(context).alreadyHaveAccount,
                          linkText: S.of(context).signUp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  PopupMenuItem<Locale> _buildLanguageItem({
    required Locale locale,
    required String title,
    required String icon,
    required bool isSelected,
  }) {
    return PopupMenuItem(
      value: locale,
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.all(AppSizes.spaceMedium),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withOpacity(0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 22, width: 22),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),

            if (isSelected)
              const Icon(Icons.check, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}
