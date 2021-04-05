import 'package:flutter/material.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/language_change_list_item.dart';
import 'package:lingo_app/models/language_change_list_model.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/list_item.dart';
import 'package:lingo_app/styles/styles.dart';

class LanguageChange extends StatefulWidget {
  @override
  _LanguageChangeState createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  List<LanguageChangeListModel> languageList = [];
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _language_name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageList.add(LanguageChangeListModel(
      'Asusu Igbo',
      'Nigeria',
      flag_nigeria,
    ));
    languageList.add(LanguageChangeListModel(
      'English',
      'United Kingdom',
      flag_uk,
    ));
    languageList.add(LanguageChangeListModel(
      'Hausa',
      'Nigeria',
      flag_nigeria,
    ));
    languageList.add(LanguageChangeListModel(
      'Yourba',
      'Nigeria',
      flag_nigeria,
    ));

  }
  @override
  Widget build(BuildContext context) {
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
                      labelText: name_placeholder,
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
                      _language_name = input;
                    },

                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) => SizedBox(height: 14.0,),
                    itemBuilder: (context, index){
                      return  LanguageChangeListItem(
                        title: languageList[index].title,
                        subTitle: languageList[index].subTitle,
                        flag: languageList[index].flagImage,
                        onPressed: (){
                          print(languageList[index]);
                        },);
                    }
                ),
                  flex: 2,)
              ]
          ),
        ),
      ),
    );
  }
}
