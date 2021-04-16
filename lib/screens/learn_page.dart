import 'package:flutter/material.dart';
import 'package:lingo_app/localization/local_constant.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/language_selector.dart';
import 'file:///C:/Users/mezuestudios/Documents/flutterProjects/lingo_app/lib/widgets/list_item.dart';
import 'package:lingo_app/styles/styles.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _languageName = "English";
  String _languageFlag = flag_uk;
  String _username = "mezueceejay";
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return getTranslated(context, 'welcome_greeting_1');
    }
    if (hour < 17) {
      return getTranslated(context, 'welcome_greeting_3');
    }
    return getTranslated(context, 'welcome_greeting_2');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
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
                Container(
                  child: LanguageSelector(
                    languageCountry: _languageName,
                    languageCountryAsset: _languageFlag,
                  ),
                  height: 44.0,
                ),
              ],
            ),
            SizedBox(height: 14.0,),
            Row(
              children: [
                Text(greeting(), style: headlineTextalt,),
                SizedBox(height: 8.0,),
                Text(_username, style: headlineTextalt,),
              ],
            ),
            SizedBox(height: 6.0,),
          Expanded(
            flex: 1,
            child: ListView.separated(
              itemBuilder: (index, context) => ListItem(),
              itemCount: 8,
              separatorBuilder: (context, index) => SizedBox(height: 14.0,),
              scrollDirection: Axis.vertical,),
          )
          ],
        ),
      ),
    );
  }
}
