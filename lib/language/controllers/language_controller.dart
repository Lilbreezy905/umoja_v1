// ignore_for_file: public_member_api_docs, sort_constructors_first
//sub name of class Localisation controller
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umoja_v1/language/model/language.dart';
import 'package:umoja_v1/language/utils/app_constant.dart';

class LanguageController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  LanguageController({
    required this.sharedPreferences,
  }) {
    laodCurrentLanguage();
  }
  // ignore: unused_field, prefer_final_fields
  Locale _locale = Locale(
    AppConstants.languages[0].languageCode,
    AppConstants.languages[0].countryCode,
  );
  Locale get local => _locale;
  // ignore: unused_field, prefer_final_fields
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // ignore: unused_field, prefer_final_fields
  List<Language> _languages = [];
  List<Language> get language => _languages;

  void laodCurrentLanguage() async {
    _locale = Locale(
      sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
          AppConstants.languages[0].languageCode,
      sharedPreferences.getString(AppConstants.COUNTRY_CODE) ??
          AppConstants.languages[0].countryCode,
    );
    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }
}
