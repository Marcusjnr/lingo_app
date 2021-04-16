import 'package:flutter/foundation.dart';
import 'package:lingo_app/styles/styles.dart';

class LanguageChangeProvider extends ChangeNotifier{
  String languageName = "English";
  String languageFlag = flag_uk;

  updateLanguage(String languageNameGotten, String languageFlagGotten){
    languageName = languageNameGotten;
    languageFlag = languageFlagGotten;
  }


}