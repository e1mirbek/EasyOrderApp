import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/core/errors/failure.dart';
import 'package:easy_order/features/home/data/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryRepoProvider = Provider(
  (ref) => CartegoryRepo(firestore: FirebaseFirestore.instance),
);

class CartegoryRepo {
  final FirebaseFirestore _firestore;

  CartegoryRepo({required FirebaseFirestore firestore})
    : _firestore = firestore;

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final snapshot = await _firestore.collection('category').get();

      return snapshot.docs
          .map((doc) => CategoryModel.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw Failure.fromException(e);
    }
  }
}
