import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class ChallengeListItem extends StatelessWidget {
  final String cardTitle, cardDifficulty, cardStartText;
  final Function onPressed;

  ChallengeListItem(
      {this.cardTitle, this.cardDifficulty, this.cardStartText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.only(
            left: 12.0, right: 12.0, top: 14.0, bottom: 12.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cardTitle, style: cardTitleText,),
            SizedBox(height: 4.0,),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(cardDifficulty, style: cardCaptionAltTextBold,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: bgColor)),
                Expanded(child: SizedBox(height: 60.0,), flex: 2,),
                TextButton(
                  child: Text(cardStartText, style: buttonText),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
                      backgroundColor: primaryColor,
                      onSurface: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60.0)))
                  ),
                  onPressed: () => onPressed(),
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword())),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
