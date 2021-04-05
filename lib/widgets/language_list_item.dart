import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class LanguageListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String avatar;
  final Function onPressed;
  final Widget checkBoxWidget;

  LanguageListItem({
    this.title,
    this.subTitle,
    this.avatar,
    this.onPressed,
    this.checkBoxWidget
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
          padding: EdgeInsets.only(left: 12.0, right: 12.0, top:14.0, bottom: 12.0),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 44.0,
                width: 44.0,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(avatar,),
                  ),
                  radius: 50,
                ),
              ),
              SizedBox(width: 12.0,),

              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: cardTitleText,),
                    Text(subTitle, style: cardBodyText,),
                  ],
                ),
              ),

              SizedBox(width: 12.0,),

              checkBoxWidget
            ],
          )
      ),
    );
  }
}
