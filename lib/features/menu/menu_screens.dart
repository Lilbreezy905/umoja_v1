import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/features/group/screens/create_group_screen.dart';
import 'package:umoja_v1/features/notification/screens/notification_screens.dart';
import 'package:umoja_v1/features/publicite/screens/pub_screen.dart';
import 'package:umoja_v1/features/settings/screens/settings.dart';
import 'package:umoja_v1/features/suggestion/screens/suggest_screen.dart';
import 'package:badges/badges.dart' as b;
import 'package:umoja_v1/features/user_profile/screens/user_profile.dart';
import 'package:umoja_v1/features/video/views/screens/saved_screen.dart';
import 'package:umoja_v1/language/classes/language_constant.dart';

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        child: Column(
          children: [
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [],
            // ),
            ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserProfile())),
                leading: Icon(
                  Icons.person,
                  color: iconColor,
                ),
                title: Text("Account", style: textStyle)),
            ListTile(
               onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const CreateGroupScreen()));},
              leading: Icon(
                Icons.group,
                color: iconColor,
              ),
              title: Text("${translation(context).create} group",
                  style: textStyle),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()),
                );
              },
              leading: b.Badge(
                position: b.BadgePosition.topEnd(),
                badgeStyle: b.BadgeStyle(badgeColor: backgroundColor),
                badgeContent: Text(
                        "2",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    
                child: const Icon(Icons.notifications),
              ),
              title: Text(translation(context).notification, style: textStyle),
            ),
            ListTile(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SavedVideo(index: 0,))),
              leading: Icon(
                Icons.bookmark,
                color: iconColor,
              ),
              title: Text(
                  "${translation(context).save} ${translation(context).video}",
                  style: textStyle),
            ),

            ListTile(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PubScreen())),
              leading: Icon(Icons.shopping_bag, color: iconColor),
              title: Text(translation(context).advertisement, style: textStyle),
            ),
            ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsScreen())),
                leading: Icon(Icons.settings, color: iconColor),
                title: Text(translation(context).settings, style: textStyle)),
            ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SuggestScreen(),
                ),
              ),
              leading: Icon(Icons.gif_box, color: iconColor),
              title: Text(
                  "${translation(context).box} ${translation(context).off} ${translation(context).suggestions}",
                  style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
