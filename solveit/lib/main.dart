import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/app_theme.dart';
import 'providers/auth.dart';
import 'providers/theme_provider.dart';
import 'view/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: SolveItApp(),
    ),
  );
}

class SolveItApp extends ConsumerWidget {
  const SolveItApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Solve It',
      themeMode: themeMode,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: AuthRepository.isAuth ? const HomeScreen() : const HomeScreen(),
    );
  }
}
