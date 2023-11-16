import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:umoja_v1/language/classes/language.dart';
import 'package:umoja_v1/language/classes/language_constant.dart';
import 'package:umoja_v1/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = true;
  dynamic saveThemeData;

   @override
  void initState() {
    super.initState();
    getCurrentTheme();
    
  }

  Future getCurrentTheme()async{
     saveThemeData = await AdaptiveTheme.getThemeMode();
     if (saveThemeData.toString()=="AdaptiveThemeMode.dark") {
       isDarkMode  =true;
     } else {
       isDarkMode = false;
     }
  }
  @override
  Widget build(BuildContext context) {
    final textColor =  Theme.of(context).textTheme.bodyMedium;
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  Row(
          children: [
            Icon(
              Icons.settings,
              color: iconColor,
            ),
          const   SizedBox(
              width: 8,
            ),
            Text(
              translation(context).settings,
              style: textColor,
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
           
            
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child:const  Divider(
                  thickness: 0.4,
                  color: Colors.white,
                )),
             ListTile(
              onTap: (){
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              contentPadding: const EdgeInsets.all(6),
              leading: Icon(Icons.remove_red_eye,color: iconColor,),
              title:  Text(translation(context).mode,style: textColor,),
              trailing: Icon(isDarkMode?Icons.dark_mode:Icons.light_mode),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: const Divider(
                  thickness: 0.4,
                  color: Colors.white,
                )),
             ListTile(
              
              iconColor: iconColor,
              contentPadding: const EdgeInsets.all(6),
              leading: const Icon(Icons.language),
              title:  Text(translation(context).language,style: textColor,),
              trailing: DropdownButton<Language>(
        iconSize: 30,
        // hint: Text(translation(context).changeLanguage),
        onChanged: (Language? language) async {
          if (language != null) {
            Locale _locale = await setLocale(language.languageCode);
            // ignore: use_build_context_synchronously
            MyApp.setLocale(context, _locale);
          }
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),)
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: const Divider(
                thickness: 0.4,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
