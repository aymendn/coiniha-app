import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/models/user_data.dart';
import 'package:microhack/providers/auth.dart';
import 'package:microhack/repositories/firestore.dart';
import 'package:microhack/view/auth/onboarding_screen.dart';
import 'core/app_color.dart';
import 'view/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final userId = FirebaseAuth.instance.currentUser?.uid;

  UserData? userData;

  if (userId != null) {
    userData = await FirestoreRepository.getUserData(userId);
  }

  runApp(
    ProviderScope(
      overrides: [
        authProvider.overrideWith((ref) => AuthNotifier(userData)),
      ],
      child: const MicroHackApp(),
    ),
  );
}

class MicroHackApp extends ConsumerWidget {
  const MicroHackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = FirebaseAuth.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MicroHack',
      theme: ThemeData(
        fontFamily: 'baloo2',
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: AppColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (auth.currentUser != null) {
              return const HomeScreen();
            }
            return const OnboardingScreen();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
