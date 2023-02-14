import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  ThemeMode get themeMode => state;

  void toggleTheme(Brightness brightness) {
    if (brightness == Brightness.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}
