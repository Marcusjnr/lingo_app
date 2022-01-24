import 'dart:convert';

import 'package:flutter/services.dart';

class LearnQuizModel{
  String learnTitle;
  String learnSubtitle;
  String learnHintAudio;
  String learnHint;
  List<dynamic> jsonLoaded = [];

  LearnQuizModel([this.learnTitle, this.learnSubtitle, this.learnHintAudio, this.learnHint]);

  void setLearnTitle(String title){
    learnTitle = title;
  }
  String getLearnTitle(){
    return learnTitle;
  }

  void setLearnSubtitle(String subtitle){
    learnSubtitle = subtitle;
  }
  String getLearnSubtitle(){
    return learnSubtitle;
  }

  void setLearnHint(String hint){
    learnHint = hint;
  }

  String getLearnHint(){
    return learnHint;
  }

  void setLearnHintAudio(String hintAudio){
    learnHintAudio = hintAudio;
  }

  String getLearnHintAudio(){
    return learnHintAudio;
  }



}

// List<LearnQuizModel> learnQuizList(){
//   List<LearnQuizModel> learn = [];
//   LearnQuizModel challengeQuizModel = LearnQuizModel();
//   challengeQuizModel.loadJsonData();
//
//   List<dynamic> learnQuestions = challengeQuizModel.jsonLoaded;
//
//   for(var question in learnQuestions){
//     challengeQuizModel.setLearnTitle(question["title"]);
//     challengeQuizModel.setLearnSubtitle(question["subtitle"]);
//     challengeQuizModel.setLearnHint(question["hint"]);
//
//     print("Question: ");
//     print(question["title"]);
//
//     learn.add(challengeQuizModel);
//
//     challengeQuizModel = LearnQuizModel();
//   }
//
//   print("Learn: $learn");
//
//   return learn;
//
// }
