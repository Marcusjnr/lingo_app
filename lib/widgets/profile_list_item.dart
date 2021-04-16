import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class ProfileListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top:14.0, bottom: 12.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: ListTile(
        leading: Container(
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
        title: Text("This is the title", style: cardTitleText,),
        subtitle: Text("This is the subtitle", style: cardBodyText,),

      ),
    );
  }
}
