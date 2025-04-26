import 'package:event_planing_app/utils/shared_prefrance_lang.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = "en";

  void changeLanguage(String language) {
    if (currentLanguage == language) return;

    currentLanguage = language;
    updateTheLanguage(language);
    notifyListeners();
  }

  void loadTheLanguageOfTheApp() async {
    currentLanguage = await readTheLanguage();
    notifyListeners();
  }
    LanguageProvider() {
    loadTheLanguageOfTheApp(); // Load saved language at start
  }
}
