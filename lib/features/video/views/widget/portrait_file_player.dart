import 'dart:io';


import 'package:flutter/material.dart';
import 'package:umoja_v1/features/video/views/widget/video_player_fullscreen.dart';
import 'package:video_player/video_player.dart';

class PortraitFileWidget extends StatefulWidget {
  const PortraitFileWidget({super.key, required this.file});
  final File file;

  @override
  // ignore: library_private_types_in_public_api
  _PortraitPlayerWidgetState createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitFileWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.file(widget.file,)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: controller,id: "uuuuu",);
}