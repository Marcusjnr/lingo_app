import 'package:flutter/material.dart';
import 'package:lingo_app/localization/local_constant.dart';
import 'package:lingo_app/screens/forgot_password.dart';
import 'package:lingo_app/screens/sign_up_screen.dart';
import 'package:lingo_app/styles/styles.dart';

import 'home.dart';
class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _username;
  String _password;
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0, bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(getTranslated(context, 'sign_in'),
                    textAlign: TextAlign.center,
                    style: headlineText,
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Center(
                  child: Text(getTranslated(context, 'sign_in_subtitle'),
                    textAlign: TextAlign.center,
                    style: bodyOneText,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton.icon(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                              backgroundColor: fbColor,
                              onSurface: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                          ),
                          onPressed: () => print("Facebook"),
                          icon: Image.asset(facebook, height: 24.0, width: 24.0,),
                          label: Text(getTranslated(context, 'fb_sign'),style: buttonTextalt,)),
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton.icon(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                              backgroundColor: twColor,
                              onSurface: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                          ),
                          onPressed: () => print("Twitter"),
                          icon: Image.asset(twitter, height: 24.0, width: 24.0,),
                          label: Text(getTranslated(context, 'tw_sign'),style: buttonTextalt,)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Opacity(
                        opacity: 0.4,
                        child: Container(
                          height: 1.0,
                          width: 120.0,
                          color: textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(getTranslated(context, 'or_placeholder'), style: dividerText,),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Opacity(
                          opacity: 0.4,
                          child: Container(
                            height: 1.0,
                            width: 120.0,
                            color: textColor,
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
          Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(14.0)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: primaryColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: getTranslated(context, 'username_placeholder'),
                      errorMaxLines: 1,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(2.0),
                      enabled: true,
                      hintText: getTranslated(context, 'username_placeholder'),
                      hintMaxLines: 1,
                    ),
                    validator: (String input){
                      if(input.isEmpty) {
                        return getTranslated(context, 'validation_username');
                      }
                      return null;
                    },
                    onSaved: (String input) {
                      _username = input;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(14.0)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: primaryColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: getTranslated(context, 'password_placeholder'),
                      errorMaxLines: 1,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(2.0),
                      enabled: true,
                      hintText: getTranslated(context, 'password_placeholder'),
                      hintMaxLines: 1,
                    ),
                    validator: (String input){
                      if(input.length > 16){
                        return getTranslated(context, 'password_character_limit');
                      }else if(input.isEmpty) {
                        return getTranslated(context, 'validation_password');
                      }
                      return null;
                    },
                    onSaved: (String input) {
                      _password = input;
                    },

                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextButton(
                  child: Text(getTranslated(context, 'forgot_password'), style: buttonText),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                      backgroundColor: Colors.transparent,
                      onSurface: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword())),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextButton(
                  child: Text(getTranslated(context, 'sign_in'), style: buttonTextalt,),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                      backgroundColor: textColor,
                      onSurface: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                ),
              ],
            ),
          )
              ],
          )
          ),
        )
    );
  }
}
