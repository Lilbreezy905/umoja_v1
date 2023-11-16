import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String BDI = 'ko';
const String MANDARIN = 'zh';
const String ENGLISH = 'en';
const String SPANISH = 'es';
const String FRENCH = 'fr';
const String HAUSSA = 'sv';
const String HINDI = 'hi';
const String LINGALA = 'fa';
const String PANJABI = 'pa';
const String PORTUGUESSE = 'pt';
const String RUSSIAN = 'ru';
const String SWAHILI = 'sw';
const String YORUBA = 'ar';
const String CANTONESE = 'ja';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case BDI:
      return const Locale(BDI, '');
    case MANDARIN:
      return const Locale(MANDARIN, "");
    case ENGLISH:
      return const Locale(ENGLISH, "");
    case SPANISH:
      return const Locale(SPANISH, "");
    case FRENCH:
      return const Locale(FRENCH, "");
    case HAUSSA:
      return const Locale(HAUSSA, "");
    case HINDI:
      return const Locale(HINDI, "");
    case LINGALA:
      return const Locale(LINGALA, "");
    case PANJABI:
      return const Locale(PANJABI, "");
    case PORTUGUESSE:
      return const Locale(PORTUGUESSE, "");
    case RUSSIAN:
      return const Locale(RUSSIAN, "");
    case SWAHILI:
      return const Locale(SWAHILI, "");
    case YORUBA:
      return const Locale(YORUBA, "");

    case CANTONESE:
      return const Locale(CANTONESE, "");
    default:
      return const Locale(ENGLISH, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
  // return AppLocalizations.of(context)!;
}
