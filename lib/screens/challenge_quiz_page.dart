import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';
class ChallengeQuizPage extends StatefulWidget {
  ChallengeQuizPage({Key key}) : super(key: key);
  @override
  _ChallengeQuizPageState createState() => _ChallengeQuizPageState();
}

class _ChallengeQuizPageState extends State<ChallengeQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: textColor,),
            onPressed: () => Navigator.pop(context),),
          elevation: 0.0,
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  SizedBox(height: 10.0,),
                  TextButton(
                      child: Text(continue_register, style: buttonTextalt,),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                          backgroundColor: textColor,
                          onSurface: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                      ),
                      onPressed: () {
                      }
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                  ),
                ]
            )
        )

    );
  }
}
