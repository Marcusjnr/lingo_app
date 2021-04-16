import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                            Text("Mezue Chukwudi", style: headlineTextalt,),
                            Text("Edit Profile Details", style: cardCaptionAltTextAlt,),
                          ],
                        ), flex: 2,),
                      ],
                    ),
                  ),
                  SizedBox(width: 14.0,),

                ]
            )
        )
    );
  }
}
