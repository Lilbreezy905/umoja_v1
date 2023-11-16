import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerItem({super.key, required this.videoUrl});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController cachedVideoPlayerController;
  bool isPlay = false;

  @override
  void initState() {
    super.initState();
    cachedVideoPlayerController =
        VideoPlayerController.network(widget.videoUrl)
          ..initialize().then((value) {
            cachedVideoPlayerController.setVolume(1);
            // cachedVideoPlayerController.play();
          });
  }

  @override
  void dispose() {
    super.dispose();
    cachedVideoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: cachedVideoPlayerController.value.aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayer(cachedVideoPlayerController),
          Align(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () {
                    if (isPlay) {
                      cachedVideoPlayerController.pause();
                    } else {
                      cachedVideoPlayerController.play();
                    }
                    setState(() {
                      isPlay = !isPlay;
                    });
                  },
                  icon: Icon(isPlay ? null : Icons.play_circle))),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                if (isPlay) {
                  cachedVideoPlayerController.pause();
                } else {
                  cachedVideoPlayerController.play();
                }
                setState(() {
                  isPlay = !isPlay;
                });
              },
              icon: Icon(
                isPlay ? null : Icons.download,
              ),
            ),
          )
        ],
      ),
    );
  }
}
