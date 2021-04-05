import 'package:flutter/material.dart';
import 'package:lingo_app/screens/sign_up_screen.dart';
import 'package:lingo_app/styles/styles.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(forgot_password,
                    textAlign: TextAlign.center,
                    style: headlineText,
                  ),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Center(
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet numquam iure provident voluptate esse quasi. ",
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
                      labelText: username_placeholder,
                      errorMaxLines: 1,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(2.0),
                      enabled: true,
                      hintText: email_placeholder,
                      hintMaxLines: 1,
                    ),
                    validator: (String input){
                      if(input.isEmpty) {
                        return "Please enter your $email_placeholder";
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
                  child: Text(forgot_password, style: buttonText),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                      backgroundColor: Colors.transparent,
                      onSurface: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                ),


              ],
            ),
          ),
        )
    );
  }
}
