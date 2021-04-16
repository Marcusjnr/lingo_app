import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class ChallengeListItem extends StatefulWidget {
  @override
  _ChallengeListItemState createState() => _ChallengeListItemState();
}

class _ChallengeListItemState extends State<ChallengeListItem> {
  String _cardTitle, _cardDifficulty, _cardStartText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top:14.0, bottom: 12.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Introduction to Asusu Igbo", style: cardTitleText,),
          SizedBox(height: 4.0,),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Easy", style: cardCaptionAltTextBold,),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: bgColor)),
              Expanded(child: SizedBox(height: 60.0,), flex: 2,),
              TextButton.icon(
                label: Text("Start", style: buttonText),
                icon: Icon(Icons.play_arrow, color: textColor,),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0,left: 12.0, right: 12.0),
                    backgroundColor: primaryColor,
                    onSurface: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.0)))
                ),
                onPressed: () => print("Hello"),
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword())),
              ),
            ],
          )

        ],
      ),
    );
  }
}
