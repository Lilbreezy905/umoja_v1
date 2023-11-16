import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:umoja_v1/features/video/views/widget/portrait_file_player.dart';
import 'package:umoja_v1/features/video/views/widget/text_input.dart';
import 'package:video_player/video_player.dart';

class ConfirmVideoPub extends ConsumerStatefulWidget {
  const ConfirmVideoPub(
      {super.key, required this.videoPath, required this.videoFile});
  final String videoPath;
  final File videoFile;

  @override
  ConsumerState<ConfirmVideoPub> createState() => _ConfirmVideoPubState();
}

class _ConfirmVideoPubState extends ConsumerState<ConfirmVideoPub> {
  String downloadUrl = "";
  bool loading = false;
  double? parcent = 0;
  late final VideoPlayerController controller;

  final TextEditingController _caption = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);

    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 - 40,
            child: PortraitFileWidget(file: widget.videoFile),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFieldInput(
                    controller: _caption,
                    labelText: 'Add description',
                    icon: Icons.description,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Post ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                !loading
                    ? Container()
                    : LinearPercentIndicator(
                        percent: (parcent! / 100),
                        progressColor: Colors.blue,
                        backgroundColor: Colors.white,
                      )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
