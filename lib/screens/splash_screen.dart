import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingo_app/screens/home.dart';
import 'package:lingo_app/styles/styles.dart';
import '../screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer starts counting once the app starts...
    Timer(Duration(seconds: 1), () => {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.id)
      // TODO Implement a user auth system to bypass the splash screen to main activity.
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
                width: 178.0,
                child: Image.asset(lingo_logo)
            ),
            flex: 3,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
               SizedBox(
                 width: 230.0,
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

