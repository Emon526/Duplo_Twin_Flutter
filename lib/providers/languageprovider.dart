import 'package:flutter/material.dart';

import '../services/languageprefs.dart';

class LanguageProvider with ChangeNotifier {
  LanguagePreference languagePreference = LanguagePreference();

  final bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  String _currentLocale = 'en';
  String get currentLocale => _currentLocale;
  set chnageLocale(String locale) {
    _currentLocale = locale;
    languagePreference.setLanguage(locale);
    notifyListeners();
  }
}
