import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Demolization{

  Demolization(this.locale);

  final Locale locale;

  static Demolization of(BuildContext context) {
    return Localizations.of<Demolization>(context, Demolization);
  }

  Map<String, String> _localeValues;

  Future<void> load() async{
    String jsonStringValues = await rootBundle.loadString('lib/languages/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localeValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String value){
    return _localeValues[value];
  }

  //Start
static const LocalizationsDelegate<Demolization> delegate = _DemolizationDelegate();


}
class _DemolizationDelegate extends LocalizationsDelegate<Demolization>{
  const _DemolizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ig','ha','yo'].contains(locale.languageCode);
  }

  @override
  Future<Demolization> load(Locale locale) async{
    Demolization demolization = new Demolization(locale);
    await demolization.load();
    return demolization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Demolization> old) => false;
  
}