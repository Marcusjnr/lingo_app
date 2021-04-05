import 'package:flutter/material.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/language_list_item.dart';
import 'package:lingo_app/models/language_list_model.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/language_selector.dart';
import 'package:lingo_app/screens/sign_up_screen.dart';
import 'package:lingo_app/styles/styles.dart';

import 'language_change.dart';
class LanguagePicker extends StatefulWidget {
  @override
  _LanguagePickerState createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  List<LanguageListModel> languageList = [];

  @override
  void initState() {

    languageList.add(LanguageListModel(
      'Asusu Igbo',
      'Nigeria',
      flag_nigeria,
      false
    ));

    languageList.add(LanguageListModel(
        'Hausa',
        'Nigeria',
        flag_nigeria,
      false
    ));
    languageList.add(LanguageListModel(
        'Yoruba',
        'Nigeria',
        flag_nigeria,
        false
    ));
    super.initState();
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
            child: Column(
                children: [
                  Center(
                    child: Text("I speak",
                      textAlign: TextAlign.center,
                      style: cardTitleText,
                    ),
                  ),

                  SizedBox(
                    height: 20.0,),

                  GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageChange())),
                      child: LanguageSelector()),

                  SizedBox(
                    height: 20.0,),
                  Center(
                    child: Text("I want to learn",
                      textAlign: TextAlign.center,
                      style: cardTitleText,
                    ),
                  ),

                  SizedBox(
                    height: 20.0,),

                  Expanded(
                    flex: 2,
                      child: ListView.separated(
                          itemCount: languageList.length,
                          separatorBuilder: (context, index) => SizedBox(height: 14.0,),
                          itemBuilder: (context, index){
                            return  LanguageListItem(
                              title: languageList[index].title,
                              subTitle: languageList[index].subTitle,
                              avatar: languageList[index].flagImage,
                              checkBoxWidget: languageList[index].isChecked
                                  ?
                              Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/check_good.png')
                                    )
                                ),
                              )

                                  :
                              Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                              onPressed: (){
                                setState(() {
                                  languageList[index].isChecked = !languageList[index].isChecked;
                                });

                              },
                            );
                          }
                      )
                  ),

                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(14.0)
                        ),
                        child: Center(
                          child: Text(
                            continue_register,
                            style: buttonTextalt,
                          ),
                        ),
                      ),
                    ),
                ]),
          ),
        );
  }
}