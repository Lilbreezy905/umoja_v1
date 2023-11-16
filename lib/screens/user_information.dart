import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/utils/utils.dart';

class UserInformation extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformation({super.key});

  @override
  ConsumerState<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends ConsumerState<UserInformation> {
  final TextEditingController textEditingController = TextEditingController();
  File? image;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);

    setState(() {});
  }

  //enregistrement des donnees dans firestore

  void storeUserData() {
    String name = textEditingController.text.trim();
    if (name.isNotEmpty) {
      
    } else {
      showSnackBar(content: "remplie tous les champs", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                image == null
                    ? const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/backgroundImage.png"),
                        radius: 45,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(image!),
                        radius: 45,
                      ),
                Positioned(
                    bottom: -10,
                    right: 0,
                    child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo)))
              ],
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'enter your name',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: storeUserData, icon: const Icon(Icons.done))
              ],
            )
          ],
        ),
      )),
    );
  }
}
