// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:umoja_v1/features/chat/widget/video_player_item.dart';
// import 'package:umoja_v1/features/video/controller/auth_controller.dart';
// import 'package:umoja_v1/features/video/controller/video_controller.dart';
// import 'package:umoja_v1/features/video/views/screens/comment_screen.dart';

// class VideoScreen extends StatelessWidget {
//   final VideoController videoController = Get.put(VideoController());
//   final AuthController authController = Get.put((AuthController()));

//   VideoScreen({super.key});

//   buildProfile(String profilePhoto) {
//     return SizedBox(
//       width: 60,
//       height: 60,
//       child: Stack(
//         children: [
//           Positioned(
//               left: 3,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 padding: const EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(25),
//                   child: Image(
//                     image: NetworkImage(
//                       profilePhoto,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Obx(() {
//         return PageView.builder(
//           itemCount: videoController.videoList.length,
//           controller: PageController(initialPage: 0, viewportFraction: 1),
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             final data = videoController.videoList[index]; //67287708
//             return Stack(
//               children: [
//                 VideoPlayerItem(
//                   videoUrl: data.videoUrl,
//                 ),
//                 Column(
//                   children: [
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               padding: const EdgeInsets.only(left: 20),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text(
//                                     data.userName,
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     data.caption,
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.music_note,
//                                         color: Colors.white,
//                                       ),
//                                       Text(
//                                         data.songName,
//                                         style: const TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 100,
//                             margin: EdgeInsets.only(top: size.height / 5),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 buildProfile(data.profilePhoto),
//                                 Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () =>
//                                           videoController.likeVideo(data.id),
//                                       child: Icon(
//                                         Icons.favorite,
//                                         color: data.likes.contains(
//                                                 authController.user.uid)
//                                             ? Colors.red
//                                             : Colors.white,
//                                         size: 40,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       data.likes.length.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () => Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                           builder: (context) => CommentScreen(
//                                             id: data.id,
//                                           ),
//                                         ),
//                                       ),
//                                       child: const Icon(
//                                         Icons.comment,
//                                         color: Colors.white,
//                                         size: 40,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       data.commentCount.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {},
//                                       child: const Icon(
//                                         Icons.reply,
//                                         color: Colors.white,
//                                         size: 40,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       data.shareCount.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {},
//                                       child: const Icon(
//                                         Icons.download,
//                                         color: Colors.white,
//                                         size: 40,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     const Text(
//                                       //77417140 69347211

//                                       "",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         );
//       }),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/common/widget/loader.dart';
import 'package:umoja_v1/features/video/model/video.dart';
import 'package:umoja_v1/features/video/views/screens/comment_screen.dart';
import 'package:umoja_v1/features/video/views/screens/profile_screen.dart';
import 'package:umoja_v1/features/video/views/screens/report_screen.dart';
import 'package:umoja_v1/features/video/views/widget/portait_player_widget.dart';

class VideoScreen extends ConsumerStatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  String downloadMessage = "downloading";
  bool isDownloading = false;
  // ignore: unused_field, prefer_final_fields
  var _progress = 0.0;

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget postedVideo({
    required String id,
    required String uid,
    required String userName,
    required String thumbnail,
    required String profilePic,
    required List likeCount,
    required String songName,
    required int commentCount,
    required String videoUrl,
    required String caption,
    required BuildContext context,
    required String uidNotifications,
    required List view,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileScreen(uid: uidNotifications))),
                        child: CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(profilePic),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Icon(Icons.bookmark),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Save video")
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(Icons.info),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("report video"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(caption)
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () => print("object"),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: PortraitPlayerWidget(
                  url: videoUrl,
                  id: id,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          child: Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color:
                            likeCount.contains(firebaseAuthV.currentUser!.uid)
                                ? Colors.red
                                : Theme.of(context).colorScheme.onBackground,
                      )),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(likeCount.length.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => CommentScreen(id: id))),
                          child: Icon(
                            Icons.comment,
                            size: 30,
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                      SizedBox(
                        width: 1.3,
                      ),
                      Text(
                        "$commentCount",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      Text(view.length.toString()),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return postedVideo(
              id: "data id,",
              view: [],
              uid: 'userUid',
              userName: "user Name",
              profilePic: "assets/U1.png",
              likeCount: [],
              commentCount: 2,
              caption: "caption",
              videoUrl:
                  "https://www.youtube.com/watch?v=CuB4_bkhdvo&pp=ygUabm9kZSBqcyB0dXRvcmlhbCBmcmFuw6dhaXM%3D",
              context: context,
              uidNotifications: "uid notification",
              thumbnail: "thumbnail",
              songName: "song name",
            );
          },
        ),
      ),
    );
  }
}
