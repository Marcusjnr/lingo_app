import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';
import '../screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () => {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()))
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                width: 175.0,
                child: Image.asset(lingo_logo)
            ),
            flex: 3,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
               SizedBox(
                 width: 210.0,
                 child: LinearProgressIndicator(
                   value: null,
                   backgroundColor: Colors.transparent,
                   valueColor: AlwaysStoppedAnimation(textColor),
                 ),
               )
              ],
            ),
          )
        ],
      ),
    );
  }
}

