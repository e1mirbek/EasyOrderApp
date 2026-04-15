import 'package:easy_order/features/home/data/models/category_model.dart';
import 'package:easy_order/features/home/data/repo/cartegory_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repo = ref.watch(categoryRepoProvider);

  return repo.fetchCategories();
});
