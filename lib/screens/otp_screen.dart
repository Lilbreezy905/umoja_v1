import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../colors.dart';
class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({super.key,required this.verificationId});
  void verifyOtp(WidgetRef ref,BuildContext context, userOTP){

  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
     return  Scaffold(
     appBar: AppBar(
          title: const Text("Here we verify your number",style: TextStyle(
            fontSize: 15
          ),),
           backgroundColor:backgroundColor
        ),
        body:  Center(
          child:  Column(
            children: [
          const SizedBox(height: 20,),
          const  Text("We sent message please check your sms"),
           SizedBox(
            width: size.width*0.5,
            child:  TextField(
              maxLength: 6,
                textAlign: TextAlign.center,
                decoration:  const InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    fontSize: 40
                  )
                ),
                keyboardType: TextInputType.number,
                onChanged: (val){
                      if (val.length==6) {
                        verifyOtp(ref, context, val.trim());
                      }
                },
            ),
           )
          ]
          
          ),
        ),
    );
  }
}