

import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(AppSizes.screenPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader(context),
              const SizedBox(height: AppSizes.spaceSmall,),
              _buildIllustration(),
            ],
          ),
        ),
      )),
    );
  }

  Image _buildIllustration() {
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
        const SizedBox(height: AppSizes.spaceSmall,),
          Text(S.of(context).loginSubtitle,  style: AppTextStyles.subtitle, textAlign: TextAlign.center,),
      ],
    );
  } 
}