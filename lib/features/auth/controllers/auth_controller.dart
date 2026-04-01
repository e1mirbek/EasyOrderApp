import 'package:easy_order/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AsyncValue - У него есть три состояния «из коробки»:

/// loading: (Загрузка) — крутим индикатор.

/// error: (Ошибка) — показываем красный текст.

/// data: (Данные) — показываем результат.
///
///
final authControllerProvider =
    NotifierProvider<AuthController, AsyncValue<void>>(() {
      return AuthController();
    });

class AuthController extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    // Начальное состояние: данных нет, ошибок нет, загрузки нет.
    return const AsyncValue.data(null);
  }

  // Метод для регистрации
  Future<void> register(String email, String password, String fullName) async {
    // в процессе регистрации (загрузка)
    state = const AsyncLoading();

    // Мы обращаемся к репозиторию через ref.read

    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signUp(email, fullName, password),
    );
  }

  // Метод для входа (логин)
  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signIn(email, password),
    );
  }

  // Метод для выхода (логаут)
  Future<void> logout() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signOut();
    });
  }
}
