import 'package:flutter/material.dart';
import 'package:umoja_v1/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Sign in with umoja",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: ()=>navigateToLogin(context), child: Text("signIn"))
                  ],
                ),
          )),
    );
  }
}
