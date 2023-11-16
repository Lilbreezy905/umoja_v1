import 'package:flutter/material.dart';
import 'package:umoja_v1/features/video/views/widget/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerNetwork extends StatefulWidget {
  final String url;
  const VideoPlayerNetwork({super.key, required this.url});

  @override
  State<VideoPlayerNetwork> createState() => _PortraitPlayerState();
}

class _PortraitPlayerState extends State<VideoPlayerNetwork> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _videoPlayerController.play());
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(
      controller: _videoPlayerController,
    );
  }
}
