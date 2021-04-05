import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class LanguageSelector extends StatelessWidget {
  String _languageCountryAsset, _languageCountry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: whiteColor,
      ),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            height: 30.0,
            width: 30.0,
            child: CircleAvatar(
              child: Image.asset(flag_uk),
              radius: 20,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text("English", style: bodyOneTextBold,),
          SizedBox(
            height: 12.0,
          ),
          Icon(Icons.arrow_drop_down_rounded, size: 24.0,)
        ],
      ),
    );
  }
}
