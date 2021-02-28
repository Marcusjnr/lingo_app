import 'package:flutter/material.dart';
import 'package:lingo_app/screens/splash_screen.dart';
import 'package:lingo_app/styles/styles.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_name,
      theme: appTheme,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

