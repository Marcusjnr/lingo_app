import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

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
  List<LanguageListModel> languageListing = [];

  LanguageListModel languageListModel = LanguageListModel();
  languageListModel.setTitle(LocaleKeys.lang_fr.tr());
  languageListModel.setsubTitle(LocaleKeys.lang_fr.tr());
  languageListModel.setImage(flag_france);
  languageListModel.setCheck(false);
  languageListing.add(languageListModel);
  languageListModel = LanguageListModel();


  return languageListing;



}