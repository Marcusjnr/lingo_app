import 'package:flutter/material.dart';
import 'package:lingo_app/models/onboarding_data.dart';
import 'package:lingo_app/screens/sign_in_screen.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/widgets/onboarding_item.dart';

import 'language_picker.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}


class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnboardingData> slider = new List<OnboardingData>();
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slider = getOnBoardingList();
    _pageController = PageController(initialPage: 0);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

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
            Expanded(
                flex: 1,
                child: PageView.builder(
                  itemCount: slider.length,
                  itemBuilder: (context, index) => OnBoardingItem( slider[index].getTitle(), slider[index].getDesc(), slider[index].getImage()
                  ),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                )),

            SizedBox(
              height: 5.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(slider.length, (index) => buildDot(index, context)),
            ),

            SizedBox(
              height: 20.0,
            ),
            TextButton(
              child: Text(get_started, style: buttonTextalt,),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                  backgroundColor: textColor,
                  onSurface: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePicker())),
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
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10.0,
      width:  _currentIndex == index ? 25 : 10,
      margin:  EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: whiteColor,
      ),

    );
  }
}
