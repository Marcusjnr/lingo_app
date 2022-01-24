import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:lingo_app/styles/styles.dart';

class ChallengeQuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("What is your name",
            textAlign: TextAlign.center,
            style: headlineTextalt,
          ),
          SizedBox(
            height: 14.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey,
            ),
            child: RadioListTile(
              title:  Text("What is your name",
                textAlign: TextAlign.center,
                style: bodyOneText,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey,
            ),
            child: RadioListTile(
              title:  Text("What is your name",
                textAlign: TextAlign.center,
                style: bodyOneText,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey,
            ),
            child: RadioListTile(
              title:  Text("What is your name",
                textAlign: TextAlign.center,
                style: bodyOneText,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey,
            ),
            child: RadioListTile(
              title:  Text("What is your name",
                textAlign: TextAlign.center,
                style: bodyOneText,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 40.0,
              width: 40.0,
              child: Icon(Icons.info_outline, size: 24.0, color: whiteColor,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: textColor,
              ),

            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
