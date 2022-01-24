import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/screens/forgot_password.dart';
import 'package:lingo_app/screens/onboarding_screen.dart';
import 'package:lingo_app/services/auth_services.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

import 'home.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign-in-screen';
  SignInScreen({Key key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded,color: textColor,),
            onPressed: () => Navigator.pop(context),
          ),
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
                  child: Text(LocaleKeys.sign_in.tr(),
                    textAlign: TextAlign.center,
                    style: headlineText,
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Center(
                  child: Text(LocaleKeys.sign_in_subtitle.tr(),
                    textAlign: TextAlign.center,
                    style: bodyOneText,
                  ),
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
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: primaryColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.email_placeholder.tr(),
                      errorMaxLines: 1,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(2.0),
                      enabled: true,
                      hintText: LocaleKeys.email_placeholder.tr(),
                      hintMaxLines: 1,
                    ),
                    validator: (String input){
                      if(input.isEmpty) {
                        return LocaleKeys.validation_email.tr();
                      }else if(!EmailValidator.validate(input)){
                        return LocaleKeys.validation_email_2.tr();
                      }
                      return null;
                    },
                    onSaved: (String input) {
                      _email = input;
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
                      labelText: LocaleKeys.password_placeholder.tr(),
                      errorMaxLines: 1,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(2.0),
                      enabled: true,
                      hintText: LocaleKeys.password_placeholder.tr(),
                      hintMaxLines: 1,
                    ),
                    validator: (String input){
                      if(input.length > 16){
                        return LocaleKeys.password_character_limit.tr();
                      }else if(input.isEmpty) {
                        return LocaleKeys.validation_password.tr();
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
                  child: Text(LocaleKeys.forgot_password.tr(), style: buttonText),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                      backgroundColor: Colors.transparent,
                      onSurface: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                  ),
                  onPressed: () => Navigator.pushNamed(context, ForgotPassword.id),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextButton(
                  child: Text(LocaleKeys.sign_in.tr(), style: buttonTextalt,),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                      backgroundColor: textColor,
                      onSurface: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                  ),
                  onPressed: () => _confirmUser(),
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

  _confirmUser() {
    if(_globalKey.currentState.validate()){
      _globalKey.currentState.save();
      AuthService.signInUser(context, _email, _password);
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
