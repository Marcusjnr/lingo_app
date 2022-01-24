import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class ProfileListItem extends StatelessWidget {
  final String settingTitle, settingSubtitle;
  final dynamic  settingImage;
  final Function onPressed;

  ProfileListItem({this.settingTitle, this.settingSubtitle, this.settingImage, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        },
      child: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top:8.0, bottom: 8.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: ListTile(
          leading: Container(
            height: 36.0,
            width: 36.0,
            child: Icon(settingImage, size: 28.0, color: Colors.white,),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(64.0),
            ),
          ),
          title: Text(settingTitle, style: cardTitleText,),
          subtitle: Text(settingSubtitle, style: cardBodyText,),

        ),
      ),
    );
  }
}
