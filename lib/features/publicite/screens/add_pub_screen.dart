import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umoja_v1/features/publicite/screens/confirm_image_pub.dart';
import 'package:umoja_v1/features/publicite/screens/confirm_pub_video.dart';

class AddPubScreen extends StatefulWidget {
  const AddPubScreen({super.key});

  @override
  State<AddPubScreen> createState() => _AddPubScreenState();
}

class _AddPubScreenState extends State<AddPubScreen> {
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmVideoPub(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }

  pickImage(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickImage(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmiImagePub(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }


   
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium;
    // final backgroundColor = Theme.of(context).colorScheme.background;
    // final iconColor = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
      // backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Add your pub here ",
      //     style: textColor!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
      //   ),
      // ),
      body: 
      
      
      Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/2,),
            ElevatedButton(
              onPressed: ()=>pickVideo(ImageSource.gallery, context),
              child: Text(
                "Import Video",
                style: textColor,
              ),
            ),

             ElevatedButton(
              onPressed: ()=>pickImage(ImageSource.gallery, context),
              child: Text(
                "Import Photo",
                style: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
