// // ignore_for_file: unused_field

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:umoja_v1/common/widget/loader.dart';
// import 'package:umoja_v1/features/video/model/video.dart';
// import 'package:video_player/video_player.dart';

// class TestVideoPlayer extends ConsumerStatefulWidget {
//   const TestVideoPlayer({
//     super.key,
//     required this.uid,
//   });

//   final String uid;

//   @override
//   ConsumerState<TestVideoPlayer> createState() => _TestVideoPlayer();
// }

// class _TestVideoPlayer extends ConsumerState<TestVideoPlayer> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;

//   // @override
//   // void initState() {
//   //   super.initState();
//   // _videoPlayerController = VideoPlayerController.network(widget.videoUrl);

//   // _chewieController = ChewieController(
//   //   autoPlay: true,
//   //   videoPlayerController: _videoPlayerController,
//   //   aspectRatio: _videoPlayerController.value.aspectRatio,
//   // );
//   // }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _videoPlayerController.dispose();
//   //   _chewieController.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<List<Video>>(
//           stream: ref
//               .watch(betterPlayerControllerProvider)
//               .getUserVideosStream(widget.uid),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Loader();
//             }
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final data = snapshot.data![index];
//                 return Column(
//                   children: [
//                     ListTile(
//                       title: Text(data.caption),
//                     )
//                   ],
//                 );
//               },
//             );
//           }),
//     );
//   }
// }
