import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:umoja_v1/features/video/views/widget/portrait_landscape_page.dart';

class ShowProfileVideos extends StatefulWidget {
  final String videoUrl;
  const ShowProfileVideos({super.key, required this.videoUrl});

  @override
  State<ShowProfileVideos> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<ShowProfileVideos> {
  late VideoPlayerController cachedVideoPlayerController;

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
    return Stack(
      children: [
        VideoPlayer(cachedVideoPlayerController),
        Align(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PortraitLandscapePlayerPage(
                          videoUrl: widget.videoUrl,
                        ))),
                icon: const Icon(Icons.play_circle))),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.download,
          ),
        )
      ],
    );
  }
}
