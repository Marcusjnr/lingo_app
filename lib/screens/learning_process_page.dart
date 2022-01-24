import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';
class LearningProcessPage extends StatefulWidget {
  LearningProcessPage({Key key}) : super(key: key);
  @override
  _LearningProcessPageState createState() => _LearningProcessPageState();
}

class _LearningProcessPageState extends State<LearningProcessPage> {
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
                ]
            )
        )
    );
  }
}
