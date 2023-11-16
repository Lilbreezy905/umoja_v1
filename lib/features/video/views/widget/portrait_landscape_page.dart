// import 'package:flutter/material.dart';
// import 'package:umoja_v1/features/video/views/widget/video_player_both_widget.dart';
// import 'package:video_player/video_player.dart';

// class PortraitLandscapePage extends StatefulWidget {
//   final String url;
//   const PortraitLandscapePage({super.key, required this.url});

//   @override
//   State<PortraitLandscapePage> createState() => _PortraitLandscapePageState();
// }

// class _PortraitLandscapePageState extends State<PortraitLandscapePage> {
//   late VideoPlayerController videoPlayerController;
//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController = VideoPlayerController.network(widget.url)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => videoPlayerController.play());
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: VideoPlayerBothWidget(
//           videoPlayerController: videoPlayerController,
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:umoja_v1/features/video/views/widget/video_player_both_widget.dart';
import 'package:video_player/video_player.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  const PortraitLandscapePlayerPage({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  // ignore: library_private_types_in_public_api
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: VideoPlayerBothWidget(controller: controller),
      );
}
