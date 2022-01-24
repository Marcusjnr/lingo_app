import 'package:flutter/material.dart';
import 'package:lingo_app/screens/home.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

class LearnCompleted extends StatefulWidget {
  @override
  _LearnCompletedState createState() => _LearnCompletedState();
}

class _LearnCompletedState extends State<LearnCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0, bottom: 12.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Center(
                      child: Text("Learning Completed",
                      textAlign: TextAlign.center,
                      style: headlineText,
                    ),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Center(
                      child: Text("Congratulations, you've completed your learning.",
                        textAlign: TextAlign.center,
                        style: bodyOneText,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(sliderImage2, height: MediaQuery.of(context).size.height/2.3,),
                  ],
                ),
              ),

              TextButton(
                child: Text("Return to Home", style: buttonTextalt,),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                    backgroundColor: textColor,
                    onSurface: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ]
        ),
      ),);
            }
}
