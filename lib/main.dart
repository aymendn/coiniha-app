import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/models/user_data.dart';
import 'package:microhack/providers/auth.dart';
import 'package:microhack/providers/shared_preferences.dart';
import 'package:microhack/repositories/firestore.dart';
import 'package:microhack/view/auth/onboarding_screen.dart';
import 'package:microhack/view/auth/sign_in_screen.dart';
import 'package:microhack/view/nav.dart';
import 'package:microhack/view/result/result_screen.dart';
import 'package:microhack/view/survey/survey_screen.dart';
import 'package:microhack/view/survey/surveys_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_color.dart';
import 'providers/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();

  final userId = FirebaseAuth.instance.currentUser?.uid;

  UserData? userData;

  if (userId != null) {
    userData = await FirestoreRepository.getUserData(userId);
  }

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
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
    final isFirstTime = ref.watch(onboardingProvider);
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
      routes: {
        '/surveys': (context) => const SurveysScreen(),
        '/survey': (context) => const SurveyScreen(),
        '/result': (context) => const ResultScreen(),
      },
      home: isFirstTime
          ? const OnboardingScreen()
          : StreamBuilder(
              stream: auth.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (auth.currentUser != null) {
                    return const Nav();
                  }
                  return const SignInScreen();
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
