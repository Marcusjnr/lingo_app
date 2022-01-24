import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/screens/sign_in_screen.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password-screen';
  ForgotPassword({Key key}) : super(key: key);
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _emailAddress;
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
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(LocaleKeys.forgot_password.tr(),
                      textAlign: TextAlign.center,
                      style: headlineText,
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Center(
                    child: Text(LocaleKeys.forgot_password_subtitle.tr(),
                      textAlign: TextAlign.center,
                      style: bodyOneText,
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
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

                  SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                    child: Text(LocaleKeys.forgot_password.tr(), style: buttonTextalt,),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                        backgroundColor: textColor,
                        onSurface: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                    ),
                    onPressed: () => _passwrdReset(),
                  ),


                ],
              ),
            ),
          ),
        )
    );
  }

  _passwrdReset() async {
    try {
      _globalKey.currentState.save();
      final user = await _auth.sendPasswordResetEmail(email: _emailAddress);
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.all(Radius.circular(14.0))),
        title: Text(LocaleKeys.confirm_forgot_mail.tr(),  style: headlineText),
        content: Container(
          child: Text(LocaleKeys.confirm_forgot_mail_subtitle.tr(), style: bodyOneText,),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushReplacementNamed(context, SignInScreen.id);
          }, child: Text(LocaleKeys.continue_text.tr(), style: buttonTextAltX,))
        ],
      );
    } catch (e) {
      print(e);
    }
  }
}
