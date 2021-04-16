import 'package:flutter/material.dart';
import 'package:lingo_app/localization/demolocalization.dart';
import 'package:lingo_app/localization/local_constant.dart';
import 'package:lingo_app/widgets/language_list_item.dart';
import 'package:lingo_app/models/language_list_model.dart';
import 'package:lingo_app/providers/language_change_provider.dart';
import 'package:lingo_app/widgets/language_selector.dart';
import 'package:lingo_app/screens/sign_up_screen.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:provider/provider.dart';
import 'language_change.dart';
class LanguagePicker extends StatefulWidget {
  LanguagePicker({Key key}) : super(key: key);
  @override
  _LanguagePickerState createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  List<LanguageListModel> languageListing = new List<LanguageListModel>();
  String _languageName = "English";
  String _languageFlag = flag_uk;

  @override
  void initState() {
    super.initState();
  }

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
        child: Column(
            children: [
              Center(
                child: Text(getTranslated(context, 'picker_i_speak'),
                  textAlign: TextAlign.center,
                  style: cardTitleText,
                ),
              ),

              SizedBox(
                height: 20.0,),

              GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LanguageChange())),
                  child: LanguageSelector(
                    languageCountry: Provider.of<LanguageChangeProvider>(context, listen: false).languageName,
                    languageCountryAsset: Provider.of<LanguageChangeProvider>(context, listen: false).languageFlag,
                  )),

              SizedBox(
                height: 20.0,),
              Center(
                child: Text(getTranslated(context, 'picker_i_want'),
                  textAlign: TextAlign.center,
                  style: cardTitleText,
                ),
              ),

              SizedBox(
                height: 20.0,),

              Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemCount: languageListing.length,
                      separatorBuilder: (context, index) => SizedBox(height: 14.0,),
                      itemBuilder: (context, index){
                        return  LanguageListItem(
                          title: languageListing[index].title,
                          subTitle: languageListing[index].subTitle,
                          avatar: languageListing[index].flagImage,
                          checkBoxWidget: languageListing[index].isChecked
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
                              languageListing[index].isChecked = !languageListing[index].isChecked;
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
                      getTranslated(context, 'continue_text'),
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
