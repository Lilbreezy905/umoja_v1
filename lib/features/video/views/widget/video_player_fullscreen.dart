// import 'package:flutter/material.dart';
// import 'package:umoja_v1/features/video/views/widget/basic_overlay_widget.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerFullScreen extends StatelessWidget {
//   final VideoPlayerController videoPlayerController;
//   const VideoPlayerFullScreen({super.key, required this.videoPlayerController});

//   @override
//   Widget build(BuildContext context) =>
//       // ignore: unnecessary_null_comparison
//       videoPlayerController != null && videoPlayerController.value.isInitialized
//           ? Container(
//               alignment: Alignment.topCenter,
//               child: buildVideo(),
//             )
//           : const Center(child: CircularProgressIndicator());

//   Widget buildVideo() => Stack(fit: StackFit.expand, children: <Widget>[
//         buildVideoPlayer(),
//         Positioned.fill(
//           child:
//               BasicOverLayWigdet(videoPlayerController: videoPlayerController),
//         )
//       ]);
//   Widget buildVideoPlayer() => buildFullScreen(
//         child: AspectRatio(
//             aspectRatio: videoPlayerController.value.aspectRatio,
//             child: VideoPlayer(videoPlayerController)),
//       );

//   Widget buildFullScreen({
//     required Widget child,
//   }) {
//     final size = videoPlayerController.value.size;
//     final width = size.width;
//     final height = size.height;

//     return FittedBox(
//       fit: BoxFit.cover,
//       child: SizedBox(
//         height: height,
//         width: width,
//         child: child,
//       ),
//     );
//   }
// }
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:umoja_v1/features/video/views/widget/basic_overlay_widget.dart';

class VideoPlayerFullscreenWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerFullscreenWidget({super.key, required this.controller, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) =>
      // ignore: unnecessary_null_comparison
      controller != null && controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : const Center(child: CircularProgressIndicator());

  Widget buildVideo() => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          buildVideoPlayer(),
          BasicOverlayWidget(controller: controller,id: id,),
        ],
      );

  Widget buildVideoPlayer() => buildFullScreen(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );

  Widget buildFullScreen({
    required Widget child,
  }) {
    final size = controller.value.size;
    final width = size.width;
    final height = size.height;

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}
