import 'package:flutter/material.dart';
import 'package:lingo_app/models/profile_list_model.dart';
import 'package:lingo_app/services/auth_services.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';
import 'package:lingo_app/widgets/profile_list_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileListModel> profileListModel = new List<ProfileListModel>();
  String user_name = "Chukwudi Mezue";
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    profileListModel = profileList(context);
    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  GestureDetector(
                    onTap: () => print("Edit Profile"),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 44.0, width: 44.0,
                          child: CircleAvatar(
                            child: ClipOval(child: Image.asset(default_avatar)),
                            radius: 30.0,
                          ),
                        ),
                        SizedBox(width: 14.0,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user_name, style: headlineTextalt,),
                            Text(LocaleKeys.edit_profile_details.tr(), style: cardCaptionAltTextAlt,),
                          ],
                        ), flex: 2,),
                      ],
                    ),
                  ),
                  SizedBox(width: 14.0,),

                  Expanded(
                    flex: 2,
                    child: ListView.separated(itemBuilder: (context, index) => ProfileListItem(
                      settingImage: profileListModel[index].settingImage,
                      settingTitle: profileListModel[index].settingTitle,
                      settingSubtitle: profileListModel[index].settingSubTitle,
                      onPressed: () {
                        setState(() {
                          if(profileListModel[index].settingTitle == "Sign Out"){
                            AuthService.signOut(context);
                          }else if(profileListModel[index].settingTitle == "Cloud Storage"){
                            _showMyDialog(context);
                          }else if(profileListModel[index].settingTitle == "Privacy Policy"){
                            _showMyDialog(context);
                          }else if(profileListModel[index].settingTitle == "About"){
                            _showMyDialog(context);
                          }else if(profileListModel[index].settingTitle == "Theme"){
                            _showMyDialog(context);
                          }else if(profileListModel[index].settingTitle == "Change Language") {
                            _showMyDialog(context);
                          }
                          print(profileListModel[index].settingTitle);
                        });

                      }
                      ,), separatorBuilder: (context, index) => SizedBox(height: 14.0,), itemCount: profileListModel.length),
                  ),
                ]
            )
        )
    );
  }
}

Future  _showMyDialog(BuildContext context) async {
  return showDialog (
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context)
  {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius:
      BorderRadius.all(Radius.circular(14.0))),
      title: Text(
          "Error", style: headlineTextalt),
      content: Container(
        child: Text("Feature not implemented",
          style: bodyOneText,),),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        },
            child: Text(LocaleKeys.continue_text.tr(), style: buttonTextAltX,)),
      ],
    );
  } );
}
