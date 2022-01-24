import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/screens/challenge_completed_page.dart';
import 'package:lingo_app/screens/learn_page_quiz.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';
import 'package:lingo_app/widgets/language_selector.dart';
import 'package:lingo_app/widgets/list_item.dart';
import 'package:lingo_app/styles/styles.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _languageName = "Igbo";
  String _languageFlag = flag_nigeria;
  String _username = "mezueceejay";

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return LocaleKeys.welcome_greeting_1.tr();
    }
    if (hour < 17) {
      return LocaleKeys.welcome_greeting_3.tr();
    }
    return LocaleKeys.welcome_greeting_2.tr();
  }
  List _item = [];

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/challenges/learn_quiz_list.json');
    var data = await json.decode(jsonText);
    setState(() {
      _item = data["learn_quiz_list"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadJsonData();
    print(loadJsonData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    print("easy");

                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 44.0, width: 44.0,
                    child: CircleAvatar(
                      child: ClipOval(child: Image.asset(default_avatar)),
                      radius: 30.0,
                    ),
                  ),
                ),
                Expanded(child: SizedBox( height: 30.0,), flex: 1,),
                Container(
                  child: LanguageSelector(
                    languageCountry: _languageName,
                    languageCountryAsset: _languageFlag,
                  ),
                  height: 44.0,
                ),
              ],
            ),
            SizedBox(height: 14.0,),
            Row(
              children: [
                Text(greeting(), style: headlineTextalt,),
                SizedBox(height: 8.0,),
                Text(_username, style: headlineTextalt,),
              ],
            ),
            SizedBox(height: 6.0,),
          Expanded(
            flex: 1,
            child: ListView.separated(
              itemBuilder: (context, index) {
                var cardTitle = _item[index] ['title'];
                var cardDifficulty = _item[index] ['difficulty'];
                var cardSubtitle = _item[index] ['subtitle'];
                return ListItem(
                  cardTitle: cardTitle,
                  cardDesc: cardSubtitle,
                  cardDifficulty: cardDifficulty,
                  cardStartText: "Start",
                  onPressed: (){
                    if(_item[index] ['id'] == 'learning_1_greeting'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPageQuiz(learnType: "greeting")));
                    }else if(_item[index] ['id'] == 'learning_2_phrases'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPageQuiz(learnType: "phrases")));
                    }else if(_item[index] ['id'] == 'learning_3_foods'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPageQuiz(learnType: "foods")));
                    }else if(_item[index] ['id'] == 'learning_4_numbers'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPageQuiz(learnType: "numbers")));
                    }else if(_item[index] ['id'] == 'learning_5_time'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LearnPageQuiz(learnType: "time")));
                    }

                  },
                );
              } ,
              itemCount: _item.length,
              separatorBuilder: (context, index) => SizedBox(height: 14.0,),
              scrollDirection: Axis.vertical,),
          )
          ],
        ),
      ),
    );
  }
}
