import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/features/video/model/video.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayer extends ConsumerStatefulWidget {
  const ChewieVideoPlayer({
    super.key,
    required this.uid,
    required this.id,
    required this.videoUrl,
    required this.caption,
    required this.userName,
    required this.followers,
    required this.like,
    required this.commentCount,
    required this.profilePic,
  });

  final String uid;
  final String id;
  final String videoUrl;
  final String caption;
  final String userName;
  final String followers;
  final String profilePic;
  final String like;
  final String commentCount;

  @override
  ConsumerState<ChewieVideoPlayer> createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends ConsumerState<ChewieVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool init = false;

  List<Video> currentUserVideo = [];

  String uid = "";
  String id = "";
  String videoUrls = "";
  String caption = "";
  String userName = "";
  String followers = "";
  String profilePic = "";
  String like = "";
  String commentCount = "";
  int currentIndex = 0;
  @override
  void initState() {
    uid = widget.uid;
    videoUrls = widget.videoUrl;
    super.initState();
    _videoPlayerController = VideoPlayerController.network(videoUrls);

    _chewieController = ChewieController(
      autoPlay: true,
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,

    );
   
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1/1,
                child: Chewie(controller: _chewieController),
              ),
            ],
          ),
          
          // SizedBox(
          //   height: 87,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //          Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 5),
          //           child: Text(caption),
          //         ),
          //         ListTile(
          //           leading: CircleAvatar(
          //             backgroundImage: NetworkImage(widget.profilePic),
          //           ),
          //           title: Row(
          //             children: [
          //               Text(
          //                 widget.caption,
          //                 style: const TextStyle(fontSize: 20),
          //               ),
          //             ],
          //           ),
          //           subtitle: Row(
          //             children: [
          //               Text(widget.userName),
          //               const SizedBox(
          //                 width: 40,
          //               ),
          //               Icon(Icons.favorite),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               Text(widget.like),
          //               const SizedBox(
          //                 width: 20,
          //               ),
          //               const Icon(Icons.comment),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               Text(widget.commentCount)
          //             ],
          //           ),
                  
          //         )
          //       ],
          //     ),
          //   ),
          // ),
         
        ],
      ),
    );
  }
}
