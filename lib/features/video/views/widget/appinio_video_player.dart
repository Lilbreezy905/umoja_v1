import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppinionVideoPlayer extends StatefulWidget {
  const AppinionVideoPlayer({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<AppinionVideoPlayer> createState() => _AppinionVideoPlayerState();
}

class _AppinionVideoPlayerState extends State<AppinionVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);

    _chewieController = ChewieController(
      autoPlay: true,
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}
