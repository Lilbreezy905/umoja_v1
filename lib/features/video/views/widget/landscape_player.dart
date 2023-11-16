// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:umoja_v1/features/video/views/widget/video_player_fullscreen.dart';
// import 'package:video_player/video_player.dart';
// import 'package:wakelock/wakelock.dart';

// class LandScapePlayer extends StatefulWidget {
//   final String url;
//   const LandScapePlayer({super.key, required this.url});

//   @override
//   State<LandScapePlayer> createState() => _PortraitWidgetState();
// }

// class _PortraitWidgetState extends State<LandScapePlayer> {
//   late VideoPlayerController videoPlayerController;
//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController = VideoPlayerController.network(widget.url)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => videoPlayerController.play());
//     setLandscape();
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     setAllOrientation();
//     super.dispose();
//   }

//   Future setAllOrientation() async {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
//     await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//     await Wakelock.disable();
//   }

//   Future setLandscape() async {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.bottom]);
//     await SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.landscapeRight,
//     ]);
//     await Wakelock.enable();
//   }

//   @override
//   Widget build(BuildContext context) =>
//       VideoPlayerFullScreen(videoPlayerController: videoPlayerController);
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class LandscapePlayerPage extends StatefulWidget {
  const LandscapePlayerPage({super.key, required this.url});
  final String url;
  @override
  // ignore: library_private_types_in_public_api
  _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());

    setLandscape();
  }

  @override
  void dispose() {
    controller.dispose();
    setAllOrientations();

    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    await Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // @override
  // Widget build(BuildContext context) =>
  // VideoPlayerFullscreenWidget(controller: controller);
}
