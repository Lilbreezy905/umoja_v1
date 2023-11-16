import 'package:flutter/material.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/features/video/views/screens/add_video_screen.dart';
import 'package:umoja_v1/features/video/views/screens/profile_screen.dart';
import 'package:umoja_v1/features/video/views/screens/search_screen.dart';
import 'package:umoja_v1/features/video/views/screens/video_screen.dart';





const backgroundColor = Colors.black; //Color.fromRGBO(19, 28, 33, 1);
const textColor = Color.fromRGBO(241, 241, 242, 1);
const appBarColor = Color.fromRGBO(31, 44, 52, 1);
const webAppBarColor = Color.fromRGBO(42, 47, 50, 1);
const messageColor = Color.fromRGBO(5, 96, 98, 1);
const senderMessageColor = Color.fromRGBO(37, 45, 49, 1);
const tabColor = Color.fromRGBO(0, 167, 131, 1);
const searchBarColor = Color.fromRGBO(50, 55, 57, 1);
const dividerColor = Color.fromRGBO(37, 45, 50, 1);
const chatBarMessage = Color.fromRGBO(30, 36, 40, 1);
const mobileChatBoxColor = Color.fromRGBO(31, 44, 52, 1);
const greyColor = Colors.grey;
const blackColor = Colors.black;
const borderColor = Colors.grey;
var buttonColor = Colors.red[400];


List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  const Text('Messages Screen'),
  ProfileScreen(uid: firebaseAuthV.currentUser!.uid),
];
