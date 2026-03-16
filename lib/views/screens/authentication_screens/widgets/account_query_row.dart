import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:flutter/material.dart';

class AccountQueryRow extends StatelessWidget {
  final void Function()? onTap;
  const AccountQueryRow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
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
            ),
          ],
        ),
      ),
    );
  }
}
