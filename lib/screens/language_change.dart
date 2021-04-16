import 'package:flutter/material.dart';
import 'package:lingo_app/localization/demolocalization.dart';
import '../main.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/language_change_list_item.dart';
import 'package:lingo_app/models/language_change_list_model.dart';
import 'package:lingo_app/providers/language_change_provider.dart';
import 'package:lingo_app/screens/language_picker.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/list_item.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:provider/provider.dart';

class LanguageChange extends StatefulWidget {
  LanguageChange({Key key}) : super(key: key);
  @override
  _LanguageChangeState createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  List<LanguageChangeListModel> languageListing = new List<LanguageChangeListModel>();
  String _languagename;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    languageListing = languageList(context);
    Locale _temp = Locale("en", "UK");
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(14.0)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: primaryColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: search_placeholder,
                      errorMaxLines: 1,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black12,),
                      contentPadding: EdgeInsets.all(2.0),
                      enabled: true,
                      hintText: name_placeholder,
                      hintMaxLines: 1,
                    ),
                    validator: (String input){
                      if(input.length > 18){
                        return "Please character limit is 18";
                      }else if(input.isEmpty) {
                        return "Please enter your $name_placeholder";
                      }
                      return null;
                    },
                    onSaved: (String input) {
                      _languagename = input;
                    },

                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(child: ListView.separated(
                    itemCount: languageListing.length,
                    separatorBuilder: (context, index) => SizedBox(height: 14.0,),
                    itemBuilder: (context, index){
                      return  LanguageChangeListItem(
                        title: languageListing[index].title,
                        subTitle: languageListing[index].subTitle,
                        flag: languageListing[index].flagImage,
                        onPressed: (){
                         Provider.of<LanguageChangeProvider>(context, listen: false).updateLanguage(languageListing[index].title, languageListing[index].flagImage);
                         if(languageListing[index].languageCode == "ig"){
                           // print("Igbo");
                           _temp = Locale("ig", "NG");
                         }else if(languageListing[index].languageCode == "en"){
                           _temp = Locale("en", "UK");
                         }else if(languageListing[index].languageCode == "ha"){
                           _temp = Locale("ha", "NG");
                         }else if(languageListing[index].languageCode == "yo"){
                           _temp = Locale("yo", "NG");
                         }

                         print(_temp);
                         MyApp.setLocale(context, _temp);
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LanguagePicker()));

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
