import 'package:easy_order/features/auth/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Этот провайдер следит за состоянием авторизации в реальном времени.
// ignore: unintended_html_in_doc_comment
/// Он возвращает AsyncValue<User?>, где:
/// - User != null -> юзер залогинен
/// - User == null -> юзер гость

final authStateProvider = StreamProvider<User?>((ref) {
  // Мы обращаемся к нашему репозиторию и слушаем его стрим
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});
