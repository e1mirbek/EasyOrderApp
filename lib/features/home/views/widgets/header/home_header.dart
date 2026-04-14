import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/widgets/fields/custom_text_field.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onChatTap;

  const HomeHeader({
    super.key,
    this.onNotificationsTap,
    this.onChatTap,
  });

  static const double _horizontalPadding = 16.0;
  static const double _heightFactor = 0.20;
  static const double _minHeight = 120.0;
  static const double _maxHeight = 200.0;
  static const double _topSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight =
        (size.height * _heightFactor).clamp(_minHeight, _maxHeight);

    return Stack(
      children: [
        Image.asset(
          AppAssets.homeHeaderIllu,
          width: size.width,
          height: headerHeight,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                _horizontalPadding,
                _topSpacing,
                _horizontalPadding,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: const CustomTextField(
                      hintText: 'Поиск',
                      prefixIcon: AppAssets.searchIcon,
                    ),
                  ),
                  const SizedBox(width: AppSizes.spaceMedium),
                  IconButton(
                    onPressed: onNotificationsTap,
                    tooltip: 'Уведомления',
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: AppSizes.spaceMedium),
                  IconButton(
                    onPressed: onChatTap,
                    tooltip: 'Чат',
                    icon: const Icon(
                      Icons.chat_outlined,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
