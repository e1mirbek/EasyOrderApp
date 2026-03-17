import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String loginTitle;
  final String loginSubtitle;
  const HeaderSection({
    super.key,
    required this.loginTitle,
    required this.loginSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(loginTitle, style: AppTextStyles.title),
        const SizedBox(height: AppSizes.spaceSmall),
        Text(
          loginSubtitle,
          style: AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
