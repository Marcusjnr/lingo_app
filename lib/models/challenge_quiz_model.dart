import 'package:flutter/material.dart';

class ChallengeQuizModel {
  String challengeQuestion;
  String challengeQuestionHint;
  String correctAnswer;
  List<String> incorrectAnswers;

  ChallengeQuizModel([this.challengeQuestion, this.challengeQuestionHint, this.correctAnswer, this.incorrectAnswers]);

  void setChallengeQuestion(String question){
    challengeQuestion = question;
  }

  String getChallengeQuestion(){
    return challengeQuestion;
  }

  void setChallengeQuestionHint(String questionHint){
    challengeQuestionHint = questionHint;
  }
  String getChallengeQuestionHint(){
    return challengeQuestionHint;
  }

  void setCorrectAnswer(String Answer){
    correctAnswer = Answer;
  }

  String getCorrectAnswer(){
    return correctAnswer;
  }

  void  setIncorrectAnswers(List<String> inCorrectAns){
    incorrectAnswers = inCorrectAns;
  }

  List<String> getIncorrectAnswers(){
    return incorrectAnswers;
  }
}
List<ChallengeQuizModel> challengeList(BuildContext context){
  List<ChallengeQuizModel> challenge = [];

  ChallengeQuizModel challengeQuizModel = new ChallengeQuizModel();
  challengeQuizModel.setChallengeQuestion("question");
  challengeQuizModel.setChallengeQuestionHint("questionHint");
  challengeQuizModel.setCorrectAnswer("Answer");
  List<String> inCorrect = [];
  challengeQuizModel.setIncorrectAnswers(inCorrect);
  challenge.add(challengeQuizModel);
  challengeQuizModel = new ChallengeQuizModel();
}