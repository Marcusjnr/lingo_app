import 'package:flutter/material.dart';
import 'package:lingo_app/screens/sign_in_screen.dart';
import 'package:lingo_app/screens/sign_up_screen.dart';
import 'package:lingo_app/styles/styles.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  PageController _pageController;
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
            // Expanded(
            //     child: PageView.builder(
            //       scrollDirection: Axis.horizontal,
            //       onPageChanged: (value) {
            //         setState(() {
            //           _currentIndex = value;
            //         });
            //       },
            //     )),

            SizedBox(
              height: 10.0,
            ),
            TextButton(
              child: Text(get_started, style: buttonTextalt,),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                  backgroundColor: textColor,
                  onSurface: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
            ),
            SizedBox(height: 20.0,),
            OutlineButton(
              child: Text(sign_in, style: buttonText,),
              padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
              color: textColor,
              hoverColor: textColor,
              highlightedBorderColor: textColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
