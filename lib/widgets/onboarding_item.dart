import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class OnBoardingItem extends StatelessWidget {

  String title, desc, image;
  OnBoardingItem(this.title, this.desc, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(title,
              textAlign: TextAlign.center,
              style: headlineText,
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          Center(
            child: Text(desc,
              textAlign: TextAlign.center,
              style: bodyOneText,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Image.asset(image, height: MediaQuery.of(context).size.height/2.3,),
        ],
      ),
    );
  }
}
