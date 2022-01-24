import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

class LanguageChangeListModel{
  String title;
  String subTitle;
  String flagImage;
  String languageCode;


  LanguageChangeListModel({this.title, this.subTitle, this.flagImage, this.languageCode});

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setsubTitle(String getSubtitle){
    subTitle = getSubtitle;
  }
  void setImage(String getImage){
    flagImage = getImage;
  }
  void setLanguageCode(String getlanguageCode){
    languageCode = getlanguageCode;
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

  String getLanguageCode(){
    return languageCode;
  }
}

List<LanguageChangeListModel> languageList(BuildContext context){
  List<LanguageChangeListModel> languageListing = [];

  LanguageChangeListModel languageListModel = new LanguageChangeListModel();


  languageListModel.setTitle(LocaleKeys.lang_en.tr());
  languageListModel.setsubTitle(LocaleKeys.lang_en_country.tr());
  languageListModel.setImage(flag_uk);
  languageListModel.setLanguageCode('en');
  languageListing.add(languageListModel);
  languageListModel = new LanguageChangeListModel();


  languageListModel.setTitle(LocaleKeys.lang_fr.tr());
  languageListModel.setsubTitle(LocaleKeys.lang_fr_country.tr());
  languageListModel.setImage(flag_france);
  languageListModel.setLanguageCode('fr');
  languageListing.add(languageListModel);
  languageListModel = new LanguageChangeListModel();


  return languageListing;



}