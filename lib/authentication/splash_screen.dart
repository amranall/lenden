
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'onboard_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 400,
            width: 200,
            child: Column(
              children: [
                Image.asset("images/lenden.png"),
                SizedBox(height: 80,),
                Text("LENDEN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 33),)
              ],
            ),
          ),

          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: Onboard_Screen(),
          duration: const Duration(milliseconds: 4515),
        )
    );
  }
}
