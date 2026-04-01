import 'package:easy_order/features/auth/providers/auth_state_provider.dart';
import 'package:easy_order/core/constants/app_routes.dart';
import 'package:easy_order/core/theme/app_theme.dart';
import 'package:easy_order/features/settings/controllers/local_controller.dart';
import 'package:easy_order/firebase_options.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/features/auth/views/login_screen.dart';
import 'package:easy_order/features/auth/views/register_screen.dart';
import 'package:easy_order/features/home/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localControllerProvider);
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      title: 'Easy Order',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        // AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('ky', ''),
      ],
      home: authState.when(
        data: (user) {
          if (user != null) {
            // Если юзер есть в базе Auth — показываем главное меню
            return const MainScreen();
          }
          // Если юзера нет — показываем экран входа
          return const LoginScreen();
        },
        error: (Object error, StackTrace stackTrace) =>
            Scaffold(body: Center(child: Text(error.toString()))),
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
