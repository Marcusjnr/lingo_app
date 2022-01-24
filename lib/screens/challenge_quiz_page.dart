import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

import 'challenge_quiz_view.dart';
class ChallengeQuizPage extends StatefulWidget {
  static String id = 'challenge-quiz';
  ChallengeQuizPage({Key key}) : super(key: key);
  @override
  _ChallengeQuizPageState createState() => _ChallengeQuizPageState();
}

class _ChallengeQuizPageState extends State<ChallengeQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.only(right:40.0),
            alignment: Alignment.center,
            child: Text("1/40", style: bodyOneTextBold,),
          )

        ],
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: textColor,),
          onPressed: () => Navigator.pop(context),),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
        child: Column(
          children: [
            ChallengeQuizView(),
            // Expanded(
            //   flex: 2,
            //   child: PageView(
            //
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    child: Text("Previous", style: buttonTextalt,),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 40.0, right:40.0, top: 18.0, bottom: 18.0),
                        backgroundColor: textColor,
                        onSurface: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                    ),
                    onPressed: () {
                    }
                ),
                TextButton(
                    child: Text(LocaleKeys.continue_text.tr(), style: buttonTextalt,),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 40.0, right:40.0, top: 18.0, bottom: 18.0),
                        backgroundColor: textColor,
                        onSurface: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                    ),
                    onPressed: () {
                    }
                ),
              ],
            )
          ] ,
        ),
      ),
    );
  }
}
