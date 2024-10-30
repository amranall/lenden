import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lenden/authentication/auth.dart';

class Onboard_Screen extends StatefulWidget {
  const Onboard_Screen({super.key});

  @override
  State<Onboard_Screen> createState() => _Onboard_ScreenState();
}

class _Onboard_ScreenState extends State<Onboard_Screen> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      pageBackgroundColor: Colors.white,
      controllerColor: Colors.black54,
          totalPage: 5,
          headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        onFinish: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Login(),//RegistrationPage(),
            ),
          );
        },
        skipTextButton: Text('Skip',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
          background: [
            Image.asset('images/Onboarding.png',height: MediaQuery.of(context).size.height,),
            Image.asset('images/Onboarding2.png',height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
            Image.asset('images/Onboarding3.png',height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
            Image.asset('images/Onboarding4.png',height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
            Image.asset('images/Onboarding5.png',height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
          ],
          speed: 1.8,
          pageBodies: [

            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //=======first end===========//

            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //=======second end===========//

            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //=======Third end===========//

            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //=======Fourth end===========//

            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 480,
                  ),
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //=======Fifth end===========//

          ],
    );
  }
}
