import 'package:flutter/material.dart';
import 'package:umoja_v1/common/constant.dart';
import 'package:umoja_v1/features/chat/screens/mobile_chat_screen.dart';
import 'package:umoja_v1/models/user_model.dart';

class FollowButtonWidget extends StatelessWidget {
  const FollowButtonWidget({super.key,required this.userModel});
   final UserModel userModel;

  @override
  Widget build(BuildContext context) => GestureDetector(
       
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: 120,
          height: 50,
          child: Row(
            children: [
             userModel.uid!=firebaseAuthV.currentUser!.uid?ElevatedButton(onPressed: () =>Navigator.pushNamed(
                                  context, MobileChatScreen.routeName,
                                  arguments: {
                                    'name': userModel.name,
                                    'uid': userModel.uid,
                                    'isGroupChat': false,
                                    'profilePic': userModel.profilePic,
                                  }), child: Text("Send Message")):Container(),
            ],
          ),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 2.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child:const  Center(
          child: FittedBox(
            child: Text(
              'FOLLOW',
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.red),
        child: const Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
}