import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = "en";
  void changeLanguage(String language) {
    if (currentLanguage == language)
     { return;}
   
      currentLanguage = language;
    notifyListeners();
  }
  
}
