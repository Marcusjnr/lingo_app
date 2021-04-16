import 'package:flutter/material.dart';
import 'package:lingo_app/localization/local_constant.dart';
import 'package:lingo_app/styles/styles.dart';

class LanguageListModel{

  String title;
  String subTitle;
  String flagImage;
  bool isChecked;

  LanguageListModel({this.title, this.subTitle, this.flagImage, this.isChecked});

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setsubTitle(String getSubtitle){
    subTitle = getSubtitle;
  }
  void setImage(String getImage){
    flagImage = getImage;
  }
  void setCheck(bool check){
    isChecked = check;
  }
  String getImage(){
    return flagImage;
  }
  String getTitle(){
    return title;
  }
  String getsubTitle(){
    return subTitle;
  }

  bool getCheck(){
    return isChecked;
  }

}

List<LanguageListModel> languageList(BuildContext context){
  List<LanguageListModel> languageListing = new List<LanguageListModel>();

  LanguageListModel languageListModel = new LanguageListModel();
  languageListModel.setTitle(getTranslated(context, 'lang_ig'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_ng'));
  languageListModel.setImage(flag_nigeria);
  languageListModel.setCheck(false);
  languageListing.add(languageListModel);
  languageListModel = new LanguageListModel();


  languageListModel.setTitle(getTranslated(context, 'lang_ha'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_ng'));
  languageListModel.setImage(flag_nigeria);
  languageListModel.setCheck(false);
  languageListing.add(languageListModel);
  languageListModel = new LanguageListModel();

  languageListModel.setTitle(getTranslated(context, 'lang_yo'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_ng'));
  languageListModel.setImage(flag_nigeria);
  languageListModel.setCheck(false);
  languageListing.add(languageListModel);
  languageListModel = new LanguageListModel();

  return languageListing;



}