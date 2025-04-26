import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefKeyTheme {
  static const String currentTheme = 'currentTheme';
}

Future<void> updateTheTheme(ThemeMode themeMode) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final themeStr = themeMode == ThemeMode.dark ? 'dark' : 'light';
  await prefs.setString(PrefKeyTheme.currentTheme, themeStr);
}


Future<ThemeMode> readTheThemeMode() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final themeStr = prefs.getString(PrefKeyTheme.currentTheme) ?? 'light';

  if (themeStr == 'dark') {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
}
