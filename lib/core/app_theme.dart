import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static const fontFamily = 'sf-pro';

  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    final onBg = colorScheme.onBackground;
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      fontFamily: fontFamily,
      textTheme: TextTheme(
        displayLarge: TextStyle(fontWeight: _bold, fontSize: 48, color: onBg),
        displayMedium: TextStyle(fontWeight: _bold, fontSize: 38, color: onBg),
        displaySmall: TextStyle(fontWeight: _semiBold, fontSize: 32, color: onBg),
        headlineMedium: TextStyle(fontWeight: _semiBold, fontSize: 24, color: onBg),
        headlineSmall: TextStyle(fontWeight: _medium, fontSize: 20, color: onBg),
        titleLarge: TextStyle(fontWeight: _regular, fontSize: 18, color: onBg),
        //
        bodyLarge: const TextStyle(fontWeight: _regular, fontSize: 16),
        bodyMedium: const TextStyle(fontWeight: _bold, fontSize: 16),
        //
        bodySmall: const TextStyle(fontWeight: _semiBold, fontSize: 16),
        labelLarge: const TextStyle(fontWeight: _bold, fontSize: 18),
        //
      ),
    );
  }

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColor.primary,
    secondary: AppColor.secondary,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColor.primary,
    secondary: AppColor.secondary,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
}