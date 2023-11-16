// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:umoja_v1/features/video/model/video.dart';
// import 'package:video_player/video_player.dart';

// class SimpleVideoPlayer extends ConsumerStatefulWidget {
//   const SimpleVideoPlayer(
//       {super.key, required this.uid, required this.videoUrl});

//   final String videoUrl;
//   final String uid;

//   @override
//   ConsumerState<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
// }

// class _SimpleVideoPlayerState extends ConsumerState<SimpleVideoPlayer> {
//   late List<Video> videos;


//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = VideoPlayerController.network(widget.videoUrl)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     controller.dispose();

//     super.dispose();
//   }

//   Widget buildFullScreen({
//     required Widget child,
//   }) {
//     final size = controller.value.size;
//     final width = size.width;  
//     final height = size.height;

//     return FittedBox(
//       fit: BoxFit.cover,
//       child: SizedBox(width: width, height: height, child: child),
//     );
//   }

//   Widget buildVideoPlayer() => buildFullScreen(
//         child: AspectRatio(
//           aspectRatio: controller.value.aspectRatio,
//           child: VideoPlayer(controller),
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 300,
//             color: Colors.black,
//             child: controller.value.isInitialized
//                 ? Column(
//                     children: <Widget>[
//                       Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           buildVideoPlayer(),
//                         ],
//                       )
//                     ],
//                   )
//                 : const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//           ),
//           StreamBuilder(
//               stream: null
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator(
//                     color: Colors.white,
//                   );
//                 }
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: 3,
//                     itemBuilder: (context, index) {
//                       final data = snapshot.data![index];

//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 13),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               height: 100,
//                               width: 100,
//                               child: Image.network(
//                                 data.thumbnail,
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Text(
//                               data.caption,
//                               style: const TextStyle(fontSize: 25),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }
