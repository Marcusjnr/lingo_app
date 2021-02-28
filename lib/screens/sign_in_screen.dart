import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        SizedBox(height: 40.0,),

    ],
    ),
    );
  }
}
