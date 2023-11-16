// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:umoja_v1/features/video/views/widget/advanced_overlay_widget.dart';
// import 'package:umoja_v1/features/video/views/widget/basic_overlay_widget.dart';
// import 'package:video_player/video_player.dart';
// import 'package:auto_orientation/auto_orientation.dart';
// import 'package:native_device_orientation/native_device_orientation.dart';

// class VideoPlayerBothWidget extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;
//   const VideoPlayerBothWidget({super.key, required this.videoPlayerController});

//   @override
//   State<VideoPlayerBothWidget> createState() => _VideoPlayerBothWidgetState();
// }

// class _VideoPlayerBothWidgetState extends State<VideoPlayerBothWidget> {
//   late Orientation? target;

//   @override
//   void initState() {
//     super.initState();
//     NativeDeviceOrientationCommunicator()
//         .onOrientationChanged(useSensor: true)
//         .listen((event) {
//       final isPortrait = event == NativeDeviceOrientation.portraitUp;
//       final isLandScape = event == NativeDeviceOrientation.landscapeLeft ||
//           event == NativeDeviceOrientation.landscapeRight;
//       final isTargetPortrait = target == Orientation.portrait;
//       final isTargetLandscape = target == Orientation.landscape;

//       if (isPortrait && isTargetPortrait || isLandScape && isTargetLandscape) {
//         target = null;
//         SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) =>
//       // ignore: unnecessary_null_comparison
//       widget.videoPlayerController != null &&
//               widget.videoPlayerController.value.isInitialized
//           ? Container(
//               alignment: Alignment.topCenter,
//               child: buildVideo(),
//             )
//           : const Center(child: CircularProgressIndicator());

//   Widget buildVideo() => OrientationBuilder(builder: (context, orientation) {
//         final isPortrait = orientation == Orientation.portrait;
//         return Stack(
//             fit: isPortrait ? StackFit.loose : StackFit.expand,
//             children: <Widget>[
//               Positioned.fill(
//                 child: AdvancedOverlayWidget(
//                   onClickedFullScreen: () {
//                     target = isPortrait
//                         ? Orientation.landscape
//                         : Orientation.portrait;
//                     if (isPortrait) {
//                       AutoOrientation.landscapeRightMode();
//                     } else {
//                       AutoOrientation.portraitUpMode();
//                     }
//                   },
//                   videoPlayerController: widget.videoPlayerController,
//                 ),
//               ),
//               buildVideoPlayer(),
//               Positioned.fill(
//                 child: BasicOverLayWigdet(
//                     videoPlayerController: widget.videoPlayerController),
//               )
//             ]);
//       });

//   Widget buildVideoPlayer() => buildFullScreen(
//         child: AspectRatio(
//             aspectRatio: widget.videoPlayerController.value.aspectRatio,
//             child: VideoPlayer(widget.videoPlayerController)),
//       );

//   Widget buildFullScreen({
//     required Widget child,
//   }) {
//     final size = widget.videoPlayerController.value.size;
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

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:umoja_v1/features/video/views/widget/advanced_overlay_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlayerBothWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayerBothWidget({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerBothWidgetState createState() => _VideoPlayerBothWidgetState();
}

class _VideoPlayerBothWidgetState extends State<VideoPlayerBothWidget> {
  Orientation? target;

  @override
  void initState() {
    super.initState();

    NativeDeviceOrientationCommunicator()
        .onOrientationChanged(useSensor: true)
        .listen((event) {
      final isPortrait = event == NativeDeviceOrientation.portraitUp;
      final isLandscape = event == NativeDeviceOrientation.landscapeLeft ||
          event == NativeDeviceOrientation.landscapeRight;
      final isTargetPortrait = target == Orientation.portrait;
      final isTargetLandscape = target == Orientation.landscape;

      if (isPortrait && isTargetPortrait || isLandscape && isTargetLandscape) {
        target = null;
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      }
    });
  }

  void setOrientation(bool isPortrait) {
    if (isPortrait) {
      Wakelock.disable();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      Wakelock.enable();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }
  }

  @override
  Widget build(BuildContext context) =>
      // ignore: unnecessary_null_comparison
      widget.controller != null && widget.controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Center(child: CircularProgressIndicator());

  Widget buildVideo() => OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          setOrientation(isPortrait);

          return Stack(
            fit: isPortrait ? StackFit.loose : StackFit.expand,
            children: <Widget>[
              buildVideoPlayer(),
              Positioned.fill(
                child: AdvancedOverlayWidget(
                  controller: widget.controller,
                  onClickedFullScreen: () {
                    target = isPortrait
                        ? Orientation.landscape
                        : Orientation.portrait;

                    if (isPortrait) {
                      AutoOrientation.landscapeRightMode();
                    } else {
                      AutoOrientation.portraitUpMode();
                    }
                  },
                ),
              ),
            ],
          );
        },
      );

  Widget buildVideoPlayer() {
    final video = AspectRatio(
      aspectRatio: widget.controller.value.aspectRatio,
      child: VideoPlayer(widget.controller),
    );

    return buildFullScreen(child: video);
  }

  Widget buildFullScreen({
    required Widget child,
  }) {
    final size = widget.controller.value.size;
    final width = size.width;
    final height = size.height;

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}
