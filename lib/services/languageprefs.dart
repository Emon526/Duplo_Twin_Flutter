import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreference {
  setLanguage(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Language', value);
  }

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Language') ?? 'en';
  }
}
