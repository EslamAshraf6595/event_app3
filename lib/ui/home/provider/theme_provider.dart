import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode courrentThem = ThemeMode.light;
  void changeThemeMode(ThemeMode newtheme) {
    if (courrentThem == newtheme) {
      return;
    }

    courrentThem = newtheme;
    notifyListeners();
  }
}
