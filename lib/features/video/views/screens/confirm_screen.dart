import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/common/utils/utils.dart';
import 'package:umoja_v1/features/video/views/widget/portrait_file_player.dart';
import 'package:umoja_v1/features/video/views/widget/text_input.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class ConfirmScreen extends ConsumerStatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  ConsumerState<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends ConsumerState<ConfirmScreen> {
  bool loading = false;
  double? parcent = 0;
  late final VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  String downloadUrl = "";
  Future<String> uploadFile() async {
    setState(() {
      loading = true;
    });
    var allDocs = await firestoreV.collection('videos').get();
    int len = allDocs.docs.length;

    final storageRef =
        firebasesStorageV.ref().child("videos").child("Video $len");

    final uploadTask = storageRef.putFile(widget.videoFile);

    uploadTask.snapshotEvents.listen((TaskSnapshot snap) async {
      switch (snap.state) {
        case TaskState.running:
          final progress = 100 * (snap.bytesTransferred / snap.totalBytes);
          setState(() {
            parcent = progress.toDouble();
          });

          break;

        case TaskState.paused:
          showSnackBar(context: context, content: "upload is paused");
          break;
        case TaskState.canceled:
          showSnackBar(context: context, content: "upload was canceled");
          break;

        case TaskState.error:
          showSnackBar(context: context, content: "Error while uploading");
          break;

        case TaskState.success:
          await storageRef.getDownloadURL().then(
            (value) {
              setState(() {
                downloadUrl = value;
              });
            },
          );
          setState(() {
            loading = false;
          });
          // ignore: use_build_context_synchronously
          showSnackBar(context: context, content: "upload success");

          break;
      }
    });

    return downloadUrl;
  }

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
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
                      controller: _songController,
                      labelText: 'Song Name',
                      icon: Icons.music_note,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFieldInput(
                      controller: _captionController,
                      labelText: 'Caption',
                      icon: Icons.closed_caption,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text(
                      'Share!',
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
      ),
    );
  }
}
