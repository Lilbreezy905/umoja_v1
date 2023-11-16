import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/colors.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/common/utils/utils.dart';
import 'package:umoja_v1/features/chat/widget/chat_group.dart';
import 'package:umoja_v1/features/menu/menu_screens.dart';
import 'package:umoja_v1/features/news/pages/home.dart';
import 'package:umoja_v1/features/search/screens/search_screen.dart';
import 'package:umoja_v1/features/status/screens/confirm_status_screen.dart';
import 'package:umoja_v1/features/status/screens/status_contacts_screens.dart';
import 'package:umoja_v1/features/video/views/screens/add_video_screen.dart';
import 'package:umoja_v1/features/video/views/screens/profile_screen.dart';
import 'package:umoja_v1/features/video/views/screens/search_screen.dart';
import 'package:umoja_v1/features/video/views/screens/video_screen.dart';
import 'package:umoja_v1/language/classes/language_constant.dart';
import 'package:badges/badges.dart' as b;
import '../features/chat/widget/contacts_list.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  int bottomIconSize = 20;

  Icon bottomIcon(
      {required IconData? iconName, double size = 20, required Color? color}) {
    Icon icon;

    icon = Icon(
      iconName,
      size: size,
      color: color,
    );

    return icon;
  }

  Text label(String labelText) {
    Text text;
    text = Text(
      labelText,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );
    return text;
  }

  final List<Widget> _screens = [
    const SizedBox(child: Center(
      child: Text("News"),
    ),),
    const VideoScreen(),
    const ContactsList(),
    const ChatGroup(),
    const StatusContactScreens(),
    const Menu(),
  ];
  int selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.hidden:
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return
        // DefaultTabController(
        //   length: 5,
        //   child:
        Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
            selectedIndex == 0
                ? translation(context).news
                : selectedIndex == 1
                    ? translation(context).video
                    : selectedIndex == 2
                        ? translation(context).chats
                        : selectedIndex == 3
                            ? "Group"
                            : selectedIndex == 4
                                ? translation(context).story
                                : "Menu",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          selectedIndex == 0
              ? Container()
              : selectedIndex == 1
                  ? Row(
                      children: [
                        IconButton(
                          color: iconColor,
                          icon: bottomIcon(
                              iconName: (Icons.person),
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                  uid: firebaseAuthV.currentUser!.uid,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          color: iconColor,
                          icon: bottomIcon(
                              iconName: (Icons.add),
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddVideoScreen(),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          color: iconColor,
                          icon: bottomIcon(
                            iconName: (Icons.search),
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  : selectedIndex == 2
                      ? Row(
                          children: [
                            IconButton(
                              color: iconColor,
                              icon:
                                  const Icon(Icons.search, color: Colors.grey),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchScreenContact(),
                                  ),
                                );
                              },
                            ),
                           
                          ],
                        )
                      : selectedIndex == 3
                          ? Container()
                          : Container()
        ],
      ),

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.all(Theme.of(context).iconTheme),
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (value) => setState(() {
            selectedIndex = value;
          }),
          animationDuration: const Duration(seconds: 2),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedIndex: selectedIndex,
          destinations: [
             NavigationDestination(
              icon: const Icon(Icons.newspaper_rounded),
              label: translation(context).news,
            ),
             NavigationDestination(
              icon: const Icon(Icons.play_arrow),
              label: translation(context).video,
            ),
            NavigationDestination(
              icon: b.Badge(
                
                badgeContent:  Text("2",style: TextStyle(
                                
                            fontWeight: FontWeight.bold,
                            fontSize: 16),),
                  
                child: const Icon(Icons.chat_bubble_outline_outlined,
                ),
              ),
              label: translation(context).chats,
            ),
             const NavigationDestination(
              label:"Group",
              icon: const Icon(Icons.group)
            ),
             NavigationDestination(
              icon:const  Icon(Icons.tips_and_updates_outlined),
              label: translation(context).story,
            ),
            const NavigationDestination(
              icon: Icon(Icons.menu),
              label: "Menu",
            ),
          ],
        ),
      ),

      body: Container(
          color: Theme.of(context).colorScheme.background,
          child: _screens[selectedIndex]),

      floatingActionButton: 
           selectedIndex == 4
              ? FloatingActionButton(
                  onPressed: () async {
                    File? pickedImage = await pickImageFromGallery(context);
                    if (pickedImage != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(
                          context, ConfirmStatusScreen.routeName,
                          arguments: pickedImage);
                    }
                  },
                  backgroundColor: tabColor,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : Container(),
     
    );
  }
}
