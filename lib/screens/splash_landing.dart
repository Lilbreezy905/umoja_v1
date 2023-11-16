import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umoja_v1/features/landing/screens/landing_screen.dart';

class SplashScreenLanding extends ConsumerStatefulWidget {
  const SplashScreenLanding({super.key});

  @override
  ConsumerState<SplashScreenLanding> createState() => _SplashScreenLanding();
}

class _SplashScreenLanding extends ConsumerState<SplashScreenLanding> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      try {
         Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => const LandingScreen()));
      } on FlutterError {
        print("hello");
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/U1.png"),
              width: 200,
            ),
          
            SpinKitThreeBounce(
              color: Colors.cyan[900],
              size: 50.0,
            ),
            SizedBox(height: 10,),
            Text("Umoja",style: TextStyle(color: Colors.cyan[900], fontWeight: FontWeight.bold,fontSize: 20),)
          
          ],
        ),
      ),
    );
  }
}
