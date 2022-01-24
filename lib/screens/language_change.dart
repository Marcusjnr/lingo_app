import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';
import 'package:lingo_app/widgets/language_change_list_item.dart';
import 'package:lingo_app/models/language_change_list_model.dart';
import 'package:lingo_app/providers/language_change_provider.dart';
import 'package:lingo_app/screens/language_picker.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:provider/provider.dart';

class LanguageChange extends StatefulWidget {
  static String id = 'language-change-screen';
  LanguageChange({Key key}) : super(key: key);
  @override
  _LanguageChangeState createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  List<LanguageChangeListModel> languageListing = [];
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _languagename;


  @override
  Widget build(BuildContext context) {
    languageListing = languageList(context);
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: textColor,),
          onPressed: () => Navigator.pop(context),),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
        child: Form(
          key: _globalKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child: ListView.separated(
                    itemCount: languageListing.length,
                    separatorBuilder: (context, index) => SizedBox(height: 14.0,),
                    itemBuilder: (context, index){
                      return  LanguageChangeListItem(
                        title: languageListing[index].title,
                        subTitle: languageListing[index].subTitle,
                        flag: languageListing[index].flagImage,
                        onPressed: (){
                          if(languageListing[index].languageCode == "de"){
                            context.setLocale(Locale("de"));
                            _returntoHome(context);
                            Provider.of<LanguageChangeProvider>(context, listen: false).updateLanguage(languageListing[index].title, languageListing[index].flagImage);
                          }else if(languageListing[index].languageCode == "en"){
                            context.setLocale(Locale("en"));
                            _returntoHome(context);
                            Provider.of<LanguageChangeProvider>(context, listen: false).updateLanguage(languageListing[index].title, languageListing[index].flagImage);
                          }else if(languageListing[index].languageCode == "fr"){
                            context.setLocale(Locale("fr"));
                            _returntoHome(context);
                            Provider.of<LanguageChangeProvider>(context, listen: false).updateLanguage(languageListing[index].title, languageListing[index].flagImage);
                          }else if(languageListing[index].languageCode == "yo"|| languageListing[index].languageCode == "ha" || languageListing[index].languageCode == "ig"){
                            _showMyDialog(context);
                          }else if(languageListing[index].languageCode == "ru"){
                            context.setLocale(Locale("ru"));
                            _returntoHome(context);
                            Provider.of<LanguageChangeProvider>(context, listen: false).updateLanguage(languageListing[index].title, languageListing[index].flagImage);

                          }


                        },);
                    }
                ),
                  flex: 2,),

              ]
          ),
        ),
      ),
    );
  }
}
void _returntoHome(BuildContext context) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LanguagePicker()));
}

Future  _showMyDialog(BuildContext context) async {
  return showDialog (
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius:
          BorderRadius.all(Radius.circular(14.0))),
          title: Text(LocaleKeys.error_language_change_title.tr(),  style: headlineTextalt),
          content: Container(
            child: Text(LocaleKeys.error_language_change_subtitle.tr(), style: bodyOneText,),),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: Text(LocaleKeys.continue_text.tr(), style: buttonTextAltX,)),
          ],
        );
      }
  );
}


