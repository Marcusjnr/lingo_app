import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import '../services/greeting.dart';
import 'package:lingo_app/styles/styles.dart';

class LearnQuizView extends StatefulWidget {
  String title;
  String subtitle;
  String hint;
  var jsonText = jsonDecode(greeting);
  var jsonTextPhrases = jsonDecode(phrases);
  var jsonTextFoods = jsonDecode(foods);
  var jsonTextNumbers = jsonDecode(numbers);
  var jsonTextTime = jsonDecode(time);

  @override
  _LearnQuizViewState createState() => _LearnQuizViewState();

}

class _LearnQuizViewState extends State<LearnQuizView> {

  bool hintClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.jsonText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.9,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title,
            textAlign: TextAlign.center,
            style: headlineQuizTextalt,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(widget.subtitle,
            textAlign: TextAlign.center,
            style: cardCaptionText,
          ),
          SizedBox(
            height: 14.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      print(widget.hint);
                      hintClicked = hintClicked ? false : true;
                    });
                  },
                  child: Icon(Icons.help_outline, size: 24.0, color: whiteColor,)
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: textColor,
                ),

              ),
              SizedBox(
               width: 40.0,
              ),
              Container(
                height: 40.0,
                width: 40.0,
                child: Icon(Icons.volume_up, size: 24.0, color: whiteColor,),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: textColor,
                ),

              ),
            ],
          ),
          SizedBox(height: 20.0,),
          hintClicked ? Column(
            children: [
              Text("Hint", style: cardCaptionText,),
              SizedBox(height: 10.0,),
              Text(widget.hint, style: bodyOneHintText,)
            ],
          )
          :
              Container(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

List<LearnQuizView> getLearnPages(String greeting){
  List<LearnQuizView> learn = [];
  LearnQuizView quizView = LearnQuizView();
  var jsonText = quizView.jsonText;


  print("JsonText: $jsonText");

  if (greeting == "greeting"){
    print("Got here");
    for(var greeting in quizView.jsonText["learning_1_greeting"]){
      quizView.title = greeting["title"];
      quizView.subtitle = greeting["subtitle"];
      quizView.hint = greeting["hint"];

      print(quizView.title);

      learn.add(quizView);

      quizView = LearnQuizView();
    }
  }

  if (greeting == "phrases"){
    for(var greeting in quizView.jsonTextPhrases["learning_2_phrases"]){
      quizView.title = greeting["title"];
      quizView.subtitle = greeting["subtitle"];
      quizView.hint = greeting["hint"];

      print(quizView.title);

      learn.add(quizView);

      quizView = LearnQuizView();
    }
  }

  if (greeting == "foods"){
    for(var greeting in quizView.jsonTextFoods["learning_3_foods"]){
      quizView.title = greeting["title"];
      quizView.subtitle = greeting["subtitle"];
      quizView.hint = greeting["hint"];

      print(quizView.title);

      learn.add(quizView);

      quizView = LearnQuizView();
    }
  }

  if (greeting == "numbers"){
    for(var greeting in quizView.jsonTextNumbers["learning_4_numbers"]){
      quizView.title = greeting["title"];
      quizView.subtitle = greeting["subtitle"];
      quizView.hint = greeting["hint"];

      print(quizView.title);

      learn.add(quizView);

      quizView = LearnQuizView();
    }
  }

  if (greeting == "time"){
    for(var greeting in quizView.jsonTextTime["learning_5_time"]){
      quizView.title = greeting["title"];
      quizView.subtitle = greeting["subtitle"];
      quizView.hint = greeting["hint"];

      print(quizView.title);

      learn.add(quizView);

      quizView = LearnQuizView();
    }
  }


  print("Learn: $learn");

  return learn;

}