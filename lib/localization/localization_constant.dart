import 'package:flutter/material.dart';
import 'package:forsa/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key);
}

// const for shared preferences
const String ENGLISH = 'en';
const String ARABIC = 'ar';
const String LANGUAGE_CODE = 'language_code';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temporaryLanguage;
  switch (languageCode) {
    case ENGLISH:
      _temporaryLanguage = Locale(languageCode, 'USA');
      break;
    case ARABIC:
      _temporaryLanguage = Locale(languageCode, 'EG');
      break;
    default:
      _temporaryLanguage = Locale(ENGLISH, 'USA');
  }
  return _temporaryLanguage;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}
