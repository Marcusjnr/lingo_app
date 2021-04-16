import 'package:flutter/material.dart';
import 'package:lingo_app/localization/local_constant.dart';
import 'package:lingo_app/styles/styles.dart';

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
  List<LanguageChangeListModel> languageListing = new List<LanguageChangeListModel>();

  LanguageChangeListModel languageListModel = new LanguageChangeListModel();
  languageListModel.setTitle(getTranslated(context, 'lang_ig'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_ng'));
  languageListModel.setImage(flag_nigeria);
  languageListModel.setLanguageCode('ig');
  languageListing.add(languageListModel);
  languageListModel = new LanguageChangeListModel();


  languageListModel.setTitle(getTranslated(context, 'lang_en'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_en_country'));
  languageListModel.setImage(flag_uk);
  languageListModel.setLanguageCode('en');
  languageListing.add(languageListModel);
  languageListModel = new LanguageChangeListModel();

  languageListModel.setTitle(getTranslated(context, 'lang_ha'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_ng'));
  languageListModel.setImage(flag_nigeria);
  languageListModel.setLanguageCode('ha');
  languageListing.add(languageListModel);
  languageListModel = new LanguageChangeListModel();

  languageListModel.setTitle(getTranslated(context, 'lang_yo'));
  languageListModel.setsubTitle(getTranslated(context, 'lang_ng'));
  languageListModel.setImage(flag_nigeria);
  languageListModel.setLanguageCode('yo');
  languageListing.add(languageListModel);
  languageListModel = new LanguageChangeListModel();


  return languageListing;



}