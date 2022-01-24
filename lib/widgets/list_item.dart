import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class ListItem extends StatelessWidget {

  final String cardTitle, cardDesc, cardDifficulty, cardStartText;
  final Function onPressed;

  ListItem({this.cardTitle, this.cardDesc, this.cardDifficulty, this.cardStartText, this.onPressed,});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top:14.0, bottom: 12.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cardTitle, style: cardTitleText,),
            SizedBox(height: 8.0,),
            Text(cardDesc, style: cardBodyText,),
            SizedBox(height: 8.0,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(cardDifficulty, style: cardCaptionAltTextBold,),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: bgColor)),
                Expanded(child: SizedBox(width: 60.0,), flex: 2,),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0,left: 12.0, right: 12.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Text(cardStartText, style: buttonText),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
