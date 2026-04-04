import 'package:cloud_firestore/cloud_firestore.dart';

class UserModels {
  final String uid;
  final String email;
  final String fullName;
  final DateTime? createdAt;

  UserModels({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.createdAt,
  });

  // Превращаем Map из Firebase в объект UserModel
  factory UserModels.fromMap(Map<String, dynamic> map) {
    return UserModels(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? 'Guest',
      // Конвертируем Timestamp от Firebase в DateTime от Dart
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Если нужно отправить данные обратно в Firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'createdAt': createdAt,
    };
  }
}
