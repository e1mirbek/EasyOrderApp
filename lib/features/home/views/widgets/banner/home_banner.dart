import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/widgets/lodaer/app_loader.dart';
import 'package:easy_order/features/home/providers/banner_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  ConsumerState<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends ConsumerState<HomeBanner> {
  static const double _bannerHeight = 150.0;
  static const double _horizontalPadding = 18.0;
  static const double _verticalPadding = 13.0;
  static const double _borderRadius = 12.0;
  static const double _imageWidthFactor = 0.8;
  static const double _dotSize = 10.0;
  static const double _dotSpacing = 5.0;
  static const Duration _dotAnimationDuration = Duration(milliseconds: 300);

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banner = ref.watch(bannerProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final bannerWidth = screenWidth * _imageWidthFactor;

    return banner.when(
      data: (images) {
        if (images.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            SizedBox(
              height: _bannerHeight,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _horizontalPadding,
                      vertical: _verticalPadding,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      child: CachedNetworkImage(
                        width: bannerWidth,
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: bannerWidth,
                          decoration: BoxDecoration(
                            color: AppColors.grey200,
                            borderRadius: BorderRadius.circular(_borderRadius),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => _buildDot(index == _currentPage),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Не удалось загрузить баннеры'),
              TextButton.icon(
                onPressed: () => ref.invalidate(bannerProvider),
                icon: const Icon(Icons.refresh),
                label: const Text('Повторить'),
              ),
            ],
          ),
        );
      },
      loading: () {
        return Center(
          child: AppLoader(
            size: 20.0,
            strokeWidth: 2.0,
            color: AppColors.buttonBlue,
          ),
        );
      },
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      height: _dotSize,
      width: _dotSize,
      margin: const EdgeInsets.symmetric(horizontal: _dotSpacing),
      duration: _dotAnimationDuration,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.buttonBlue : AppColors.white,
      ),
    );
  }
}
