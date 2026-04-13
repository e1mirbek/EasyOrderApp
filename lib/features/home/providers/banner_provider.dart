import 'package:easy_order/features/home/data/repo/banner_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bannerProvider = FutureProvider<List<String>>((ref) async {
  return await ref.watch(bannerRepositoryProvider).fetchBanners();
});
