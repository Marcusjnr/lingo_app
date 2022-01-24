import 'package:flutter/material.dart';
import 'package:lingo_app/models/language_model.dart';
import 'package:lingo_app/services/translation_service.dart';
import 'package:lingo_app/utils/app_debouncer.dart';
import 'package:lingo_app/utils/helper.dart';
import 'package:lingo_app/widgets/app_dropdown.dart';
import 'package:lingo_app/styles/styles.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class ChallengesPage extends StatefulWidget {
  ChallengesPage({Key key}) : super(key: key);
  @override
  _ChallengesPageState createState() => _ChallengesPageState();

}


class _ChallengesPageState extends State<ChallengesPage> {
  String _languageName = "Igbo";
  String _languageFlag = flag_nigeria;
  String translationHint = 'Translation';
  String textHint = 'Enter Text';
  TextEditingController translationController;
  TextEditingController textController;

  List _item = [];
  String fromLang = 'English';
  String toLang = 'Igbo';
  List<String> langList = [];
  LanguageModel toLanguage;

  final _debouncer = AppDebouncer(milliseconds: 500);

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/challenges/igbo_challenge_list.json');
    var data = await json.decode(jsonText);
    setState(() {
      _item = data["igbo_challenge_list"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    langList.add('English');
    langList.add('Igbo');
    translationController = TextEditingController(text: '');
    textController = TextEditingController();

    // languageList.add(LanguageModel(
    //     'Igbo',
    //     'ig'
    // ));

    toLanguage = LanguageModel('Igbo', 'ig');

    this.loadJsonData();
    print(loadJsonData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
            padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 12.0
            ),
            child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 44.0, width: 44.0,
                        child: CircleAvatar(
                          child: ClipOval(child: Image.asset(default_avatar)),
                          radius: 30.0,
                        ),
                      ),
                      Expanded(child: SizedBox( height: 30.0,), flex: 1,),
                    ],
                  ),

                  SizedBox(height: 30.0,),

                 Row(
                   children: [
                     Expanded(
                         child: AppDropdownButton<String>(
                           value: fromLang ,
                           onChanged: (String val) async{
                             setState(() {
                               fromLang = val;
                               if(toLang.toLowerCase() == fromLang.toLowerCase()){
                                 if(fromLang.toLowerCase() == 'english'){
                                   toLang = 'Igbo';
                                 }else{
                                   toLang = 'English';
                                 }
                               }
                             });
                             if(textController.text.isNotEmpty){
                               setState(() {
                                 translationController.text = '';
                                 translationHint = 'Translating...';
                               });

                               String translation = await TranslationService.translate(
                                   textController.text,
                                   langCode(fromLang),
                                   langCode(toLang));

                               setState(() {
                                 translationController.text = translation;
                               });
                             }

                           },
                           items: langList.map((e) {
                             return DropdownMenuItem(
                               child: Text(e),
                               value: e,
                             );
                           }).toList(),
                         )
                     ),

                     SizedBox(width: 4,),

                     GestureDetector(
                       onTap: (){
                         if(fromLang.toLowerCase() == 'english'){
                           setState(() {
                             fromLang = 'Igbo';
                           });

                         }else{
                           setState(() {
                             fromLang = 'English';
                           });

                         }

                         if(toLang.toLowerCase() == 'english'){
                           setState(() {
                             toLang = 'Igbo';
                           });

                         }else{
                           setState(() {
                             toLang = 'English';
                           });

                         }
                       },
                       child: RotatedBox(
                         quarterTurns: 2,
                         child: Icon(
                           Icons.wifi_protected_setup_outlined,
                           size: 20,
                         ),
                       ),
                     ),

                     SizedBox(width: 4,),

                     Expanded(
                         child:AppDropdownButton<String>(
                           value: toLang,
                           onChanged: (String val) async{
                             setState(() {
                               toLang = val;
                               if(toLang.toLowerCase() == fromLang.toLowerCase()){
                                 if(fromLang.toLowerCase() == 'english'){
                                   fromLang = 'Igbo';
                                 }else{
                                   fromLang = 'English';
                                 }
                               }
                             });

                             if(textController.text.isNotEmpty){
                               setState(() {
                                 translationController.text = '';
                                 translationHint = 'Translating...';
                               });

                               String translation = await TranslationService.translate(
                                   textController.text,
                                   langCode(fromLang),
                                   langCode(toLang));

                               setState(() {
                                 translationController.text = translation;
                               });
                             }

                           },
                           items:
                           langList.map((e) {
                             return DropdownMenuItem(
                               child: Text(e),
                               value: e,
                             );
                           }).toList(),
                         )
                     ),
                   ],
                 ),

                 Row(
                   children: [
                     Expanded(
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 8),
                         height: 100,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border:Border.all(
                               color: appDark,
                             )
                         ),
                         child: Center(
                           child: TextField(
                             controller: textController,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: 'Enter Text'
                             ),
                             onChanged: (String text) {
                               _debouncer.run(() async{
                                 if(textController.text.isEmpty){
                                   setState(() {
                                     translationHint = 'Translation';
                                     translationController.text = '';
                                   });
                                 }else{
                                   setState(() {
                                     translationHint = 'Translating...';
                                     translationController.text = '';
                                   });
                                   String translation = await TranslationService.translate(
                                       textController.text,
                                       langCode(fromLang),
                                       langCode(toLang));

                                   setState(() {
                                     translationController.text = translation;
                                   });
                                 }



                               });
                             },
                           ),
                         ),
                       ),
                     ),

                     SizedBox(width: 4,),

                     SizedBox(width: 4,),

                     Expanded(
                       child: Container(
                         height: 100,
                         padding: EdgeInsets.symmetric(horizontal: 8),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border:Border.all(
                               color: appDark,
                             )
                         ),
                         child: Center(
                           child: TextField(
                             controller: translationController,
                             enabled: false,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: translationHint
                             ),
                           ),
                         ),
                       ),
                     ),

                   ],
                 )
                ]
            )));
  }
}
