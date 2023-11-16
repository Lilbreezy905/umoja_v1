import 'package:umoja_v1/language/model/language.dart';

class AppConstants {
  static String COUNTRY_CODE = 'country_code';
  static String LANGUAGE_CODE = 'language_code';

  static List<Language> languages = [
    Language(
        imageurl: "imageurl",
        languageName: "English",
        languageCode: "en",
        countryCode: "US"),
    Language(
        imageurl: "imageurl",
        languageName: "French",
        languageCode: "fr",
        countryCode: "FRA"),
  ];
}
