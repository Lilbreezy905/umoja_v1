import 'package:flutter/material.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/features/video/views/screens/add_video_screen.dart';
import 'package:umoja_v1/features/video/views/screens/profile_screen.dart';
import 'package:umoja_v1/features/video/views/screens/search_screen.dart';
import 'package:umoja_v1/features/video/views/screens/video_screen.dart';

class HomeVideo extends StatefulWidget {
  const HomeVideo({super.key});

  @override
  State<HomeVideo> createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: 3,
      //     itemBuilder: (context, index) {
      //       return Center(
      //         child: Row(
      //           children: [
      //             InkWell(
      //               onTap: () {},
      //               child: const Icon(Icons.home),
      //             ),
      //             InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: ((context) => const AddVideoScreen())));
      //               },
      //               child: const Icon(Icons.add),
      //             ),
      //             InkWell(
      //               onTap: () {},
      //               child: const Icon(Icons.search),
      //             ),
      //           ],
      //         ),
      //       );
      //     }),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (idx) {
      //     setState(() {
      //       pageIdx = idx;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: backgroundColor,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.white,
      //   currentIndex: pageIdx,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, size: 30),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search, size: 30),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CustomIcon(),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message, size: 30),
      //       label: 'Messages',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person, size: 30),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VideoScreen(),
                          ),
                        ),
                    icon: const Icon(Icons.play_arrow)),
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  ),
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddVideoScreen(),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(uid: firebaseAuthV.currentUser!.uid),
                    ),
                  ),
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
          Expanded(
            child: VideoScreen(),
          )
        ],
      ),
    );
  }
}
