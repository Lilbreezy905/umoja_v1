import 'dart:io';
import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar({required BuildContext context, required String content}) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  } on FlutterError {
   return;
  }
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  final ImagePicker picker = ImagePicker();
  try {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}

Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  final ImagePicker picker = ImagePicker();
  try {
    final XFile? pickedVideo =
        await picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      video = File(pickedVideo.path);
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    showSnackBar(context: context, content: e.toString());
  }
  return video;
}

// reference du cle d'activation
//T2kdF5SrtI95NALDWAW25flGGMQHCPKG

Future<GiphyGif?> pickFGif(BuildContext context) async {
  GiphyGif? gif;
  try {
    gif = await Giphy.getGif(
        context: context, apiKey: 'T2kdF5SrtI95NALDWAW25flGGMQHCPKG');
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return gif;
}
