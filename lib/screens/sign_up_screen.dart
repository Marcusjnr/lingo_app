import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lingo_app/screens/language_picker.dart';
import 'package:lingo_app/screens/onboarding_screen.dart';
import 'package:lingo_app/services/auth_services.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'home.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'sign-up-screen';
  SignUpScreen({Key key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _username;
  String _emailAddress;
  String _name;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: textColor,),
            onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(LocaleKeys.create_account.tr(),
                textAlign: TextAlign.center,
                style: headlineText,
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Center(
              child: Text(LocaleKeys.create_account_subtitle.tr(),
                textAlign: TextAlign.center,
                style: bodyOneText,
              ),
            ),
            SizedBox(
              height: 20.0,
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
                        labelText: LocaleKeys.name_placeholder.tr(),
                        errorMaxLines: 1,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(2.0),
                        enabled: true,
                        hintText: LocaleKeys.name_placeholder.tr(),
                        hintMaxLines: 1,
                      ),
                      validator: (String input){
                        if(input.length > 32){
                          return LocaleKeys.name_character_limit.tr();
                        }else if(input.isEmpty) {
                          return LocaleKeys.validation_name.tr();
                        }else if(input.length < 5){
                          return LocaleKeys.insufficient_character.tr();
                        }
                        return null;
                      },
                      onSaved: (String input) {
                        _name = input;
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
                        _emailAddress = input;
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
                      keyboardType: TextInputType.text,
                      cursorColor: primaryColor,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.username_placeholder.tr(),
                        errorMaxLines: 1,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(2.0),
                        enabled: true,
                        hintText: LocaleKeys.username_placeholder.tr(),
                        hintMaxLines: 1,
                      ),
                      validator: (String input){
                        if(input.isEmpty) {
                          return LocaleKeys.validation_username.tr();
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
                    height: 35.0,
                  ),
                  TextButton(
                      child: Text(LocaleKeys.sign_up.tr(), style: buttonTextalt,),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                          backgroundColor: textColor,
                          onSurface: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                      ),
                      onPressed: () {
                        if(_globalKey.currentState.validate()){
                          _globalKey.currentState.save();
                          AuthService.registerUser(context, _name, _emailAddress, _password, _username);
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      }

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
