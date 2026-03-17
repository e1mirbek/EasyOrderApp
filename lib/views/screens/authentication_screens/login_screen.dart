// ignore: unused_import
import 'dart:developer' as dev;

import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/views/widgets/custom_button.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/labeled_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
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
                        _buildHeader(context),
                        const SizedBox(height: AppSizes.spaceSmall),
                        _buildIllustration(),
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
                        Text.rich(
                          TextSpan(
                            text: S.of(context).alreadyHaveAccount,
                            style: AppTextStyles.subtitle,
                            children: [
                              TextSpan(
                                text: S.of(context).signUp,
                                style: AppTextStyles.subtitle.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => dev.log('open the page'),
                              ),
                            ],
                          ),
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

  Widget _buildIllustration() {
    return Image.asset(
      AppAssets.welcomeIllu,
      height: AppSizes.welcomeImageSize,
      width: AppSizes.welcomeImageSize,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(S.of(context).loginTitle, style: AppTextStyles.title),
        const SizedBox(height: AppSizes.spaceSmall),
        Text(
          S.of(context).loginSubtitle,
          style: AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
