import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/features/video/views/widget/text_input.dart';

class ConfirmiImagePub extends ConsumerStatefulWidget {
  const ConfirmiImagePub(
      {super.key, required this.videoPath, required this.videoFile});
  final String videoPath;
  final File videoFile;

  @override
  ConsumerState<ConfirmiImagePub> createState() => _ConfirmiImagePubState();
}

class _ConfirmiImagePubState extends ConsumerState<ConfirmiImagePub> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _caption = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.file(
            widget.videoFile,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
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
              ],
            ),
          )
        ],
      ),
    ));
  }
}
