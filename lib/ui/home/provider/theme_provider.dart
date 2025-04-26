import 'package:event_planing_app/utils/shard_prefrance_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode courrentThem = ThemeMode.light;
  void changeThemeMode(ThemeMode newTheme) {
    if (courrentThem == newTheme) return;

    courrentThem = newTheme;
    updateTheTheme(newTheme);
    notifyListeners();
  }

  void loadTheThemeeOfTheApp() async {
    courrentThem = await readTheThemeMode();
    notifyListeners();
  }

  ThemeProvider() {
    loadTheThemeeOfTheApp(); // Load saved language at start

  }
}
