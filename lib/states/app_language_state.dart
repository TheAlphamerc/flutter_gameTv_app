import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageState extends ChangeNotifier {
  Locale _appLocale = Locale('en');
  String languageCodeSaved;
  Locale get appLocal => _appLocale ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("en")) {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', '');
      languageCodeSaved = "en";
    } else if (type == Locale("ja")) {
      _appLocale = Locale("ja");
      await prefs.setString('language_code', 'ja');
      await prefs.setString('countryCode', '');
      languageCodeSaved = "ja";
    }
    notifyListeners();
  }
}
