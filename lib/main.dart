// ignore_for_file: unused_element

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:umoja_v1/language/classes/language_constant.dart';
import 'package:umoja_v1/router.dart';
import 'package:umoja_v1/screens/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      //light theme

      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Color.fromARGB(255, 57, 88, 68),
          secondary: Color.fromARGB(255, 25, 3, 68),
          surface: const Color(0xFF00FFAB),
          background: Colors.white,
          onBackground: Color.fromARGB(255, 3, 3, 3),
        ),
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF172774)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
      ),

      //darkTheme

      dark: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Color.fromARGB(255, 42, 63, 170),
          secondary: Color.fromARGB(255, 17, 7, 65),
          surface: Colors.white,
          background: Colors.black87,
          onBackground: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Umoja Chat',
         localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
         locale: _locale,
        theme: theme,
        darkTheme: darkTheme,

        onGenerateRoute: (settings) => generateroute(settings),
          
        home:SplashScreen(),
      ),
    );
  }
}
