// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:umoja_v1/common/utils/download.dart';
// import 'package:umoja_v1/common/widget/loader.dart';
// import 'package:umoja_v1/features/video/controller/auth_controller.dart';
// import 'package:umoja_v1/features/video/controller/better_player_controller.dart';
// import 'package:umoja_v1/features/video/controller/video_controller.dart';
// import 'package:umoja_v1/features/video/views/screens/comment_screen.dart';
// import 'package:umoja_v1/features/video/views/widget/portait_player_widget.dart';

// class SpecifProfileVideo extends ConsumerStatefulWidget {
//   const SpecifProfileVideo({super.key, required this.uid, required this.index});
//   final String uid;
//   final double index;
//   @override
//   ConsumerState<SpecifProfileVideo> createState() => _SpecifProfileVideoState();
// }

// class _SpecifProfileVideoState extends ConsumerState<SpecifProfileVideo> {
//   final AuthController authController = Get.put((AuthController()));
//   final itemController = ItemScrollController();
//   @override
//   void initState() {
//     super.initState();
//     // WidgetsBinding.instance.addPostFrameCallback((_) =>scrollToIndex(widget.index));
//   }

//   // void scrollToIndex(int index)=>itemController.jumpTo(index: index,);
//   Widget postedVideo({
//     required String id,
//     required String uid,
//     required String userName,
//     required String profilePic,
//     required List likeCount,
//     required int commentCount,
//     required String videoUrl,
//     required String caption,
//     required BuildContext context,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: CachedNetworkImageProvider(profilePic),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(userName),
//                           Text("hour"),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Icon(
//                     Icons.more_vert,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             SizedBox(
//               height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(caption)
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             Container(
//               color: Colors.white,
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               child: PortraitPlayerWidget(url: videoUrl,id: id,),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             SizedBox(
//               height: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text(likeCount.length.toString()),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(likeCount.length <= 1 ? "like" : "likes"),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text("$commentCount"),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(commentCount <= 1 ? "comment" : "comments"),
//                       const SizedBox(
//                         width: 10,
//                       )
//                     ],
//                   ),
//                   const Row(
//                     children: [
//                       Text("100 views"),
//                       const SizedBox(
//                         width: 10,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(
//               thickness: 1,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () => ref
//                             .read(videoControllerProvider)
//                             .likeVideo(
//                                 id: id,
//                                 receiverName: userName,
//                                 notificationContent: "like your picture",
//                                 receiverUid: uid),
//                         child: Icon(
//                           Icons.favorite,
//                           color: likeCount.contains(uid)
//                               ? Colors.red
//                               : Colors.white,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Text("Like")
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Row(
//                     children: [
//                       InkWell(
//                           onTap: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => CommentScreen(id: id),
//                                 ),
//                               ),
//                           child: const Icon(Icons.comment)),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text("Comment")
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       GestureDetector(
//                           onTap: () {
//                             DownloadFile().dioDownload(videoUrl, caption);
//                           },
//                           child: Icon(Icons.download)),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text("download")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(
//               thickness: 1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   final ScrollController scrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               StreamBuilder(
//                 stream: ref
//                     .watch(betterPlayerControllerProvider)
//                     .getUserVideosStream(widget.uid),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Loader();
//                   }
//                   SchedulerBinding.instance.addPostFrameCallback((_) {
//                     scrollController.jumpTo(widget.index);
//                   });
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     shrinkWrap: true,
//                     controller: scrollController,
//                     scrollDirection: Axis.vertical,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       var data = snapshot.data![index];

//                       return postedVideo(
//                         id: data.id,
//                         uid: authController.user.uid,
//                         userName: data.userName,
//                         profilePic: data.profilePhoto,
//                         likeCount: data.likes,
//                         commentCount: data.commentCount,
//                         caption: data.caption,
//                         videoUrl: data.videoUrl,
//                         context: context,
//                       );
//                     },
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
