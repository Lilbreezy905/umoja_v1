import 'dart:io';

import 'package:flutter/material.dart';
import 'package:umoja_v1/common/widget/error.dart';
import 'package:umoja_v1/features/auth/screens/login_screen.dart';
import 'package:umoja_v1/features/chat/screens/mobile_chat_screen.dart';
import 'package:umoja_v1/features/group/screens/create_group_screen.dart';
import 'package:umoja_v1/features/status/screens/confirm_status_screen.dart';
import 'package:umoja_v1/features/status/screens/status_screen.dart';
import 'package:umoja_v1/models/status_model.dart';
import 'package:umoja_v1/screens/otp_screen.dart';
import 'package:umoja_v1/screens/user_information.dart';

Route<dynamic> generateroute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((context) => const LoginScreen()));
    case OTPScreen.routeName:
      final String verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: ((context) => OTPScreen(
                verificationId: verificationId,
              )));
    case UserInformation.routeName:
      return MaterialPageRoute(builder: ((context) => const UserInformation()));

    // case SelectContactScreen.routeName:
    //   return MaterialPageRoute(
    //       builder: ((context) => const SelectContactScreen()));
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final isGroupChat = arguments['isGroupChat'];
      final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
          builder: ((context) => MobileChatScreen(
                isGroupChat: isGroupChat,
                name: name,
                uid: uid,
                profilePic: profilePic,
              )));

    case ConfirmStatusScreen.routeName:
      final file = settings.arguments as File;
      return MaterialPageRoute(
          builder: ((context) => ConfirmStatusScreen(file: file)));

    case StatusScreen.routeName:
      final status = settings.arguments as Status;
      return MaterialPageRoute(
          builder: ((context) => StatusScreen(status: status)));

    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
          builder: ((context) => const CreateGroupScreen()));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: "this page does not exist"),
              ));
  }
}
