import 'package:shared_preferences/shared_preferences.dart';

class PrefKey {
  static const String currentLanguage = 'currentLanguage';
}

void updateTheLanguage(String currentLang) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(PrefKey.currentLanguage, currentLang);
}

Future<String> readTheLanguage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String swapLanguage = prefs.getString(PrefKey.currentLanguage) ?? "en"; // default to "en"
  return swapLanguage;
}
