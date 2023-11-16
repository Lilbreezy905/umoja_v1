import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:umoja_v1/features/video/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }

  showOptionsDialog(BuildContext context) {
    // ignore: unused_local_variable
    final backgroundTheme = Theme.of(context).colorScheme.background;
    final textColor =
        Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20);
    final iconColor = Theme.of(context).colorScheme.onBackground;
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  color: iconColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery', style: textColor),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt,
                  color: iconColor,
                ),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text('Camera', style: textColor),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: iconColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel', style: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundTheme = Theme.of(context).colorScheme.background;
    final textColor =
        Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20);
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
           
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: backgroundTheme),
            child: Center(
              child: Text('Add Video', style: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
