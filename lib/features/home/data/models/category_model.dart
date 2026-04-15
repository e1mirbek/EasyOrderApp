class CategoryModel {
  final String id;
  final String name;
  final String iconUrl;

  CategoryModel({required this.id, required this.name, required this.iconUrl});

  // Превращаем данные из Firestore в нашу модель
  factory CategoryModel.fromMap(Map<String, dynamic> map, String docId) {
    return CategoryModel(
      id: docId,
      name: map['name'] ?? '',
      iconUrl: map['icon_url'] ?? '',
    );
  }
}
