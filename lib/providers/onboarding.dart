import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/providers/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';



final onboardingProvider = StateNotifierProvider<OnboardingNotifier, bool>((ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return OnboardingNotifier(sharedPreferences);
});

class OnboardingNotifier extends StateNotifier<bool> {
  OnboardingNotifier(this.prefs): super(prefs.getBool('isFirstTime') ?? true);
  
  final SharedPreferences prefs;

  void setOnboarding(bool value) {
    state = value;
    prefs.setBool('isFirstTime', value);
  }
}