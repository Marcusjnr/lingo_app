import 'package:flutter/material.dart';
const app_name = "Lingo";
const sign_in = "Sign in";
const sign_up = "Sign up";
const get_started = "Get Started";
const create_account = "Create account";
const name_placeholder = "Name";
const email_placeholder = " Email Address";
const username_placeholder = "Username";
const password_placeholder = "Password";
const home_title = "Home";
const challenge_title = "Challenges";
const profile_title = "Profile";
const Color primaryColor = Color(0xffFFAB00);
const Color textColor = Color(0xff171717);
const Color whiteColor = Color(0xffffffff);
const lingo_logo = "assets/images/lingo_logo.png";
const flag_nigeria = "assets/images/flags/flag_nigeria.png";
const flag_uk = "assets/images/flags/flag_united_kingdom.png";
var appTheme = ThemeData(
  primaryColor: primaryColor,
);
var buttonTextalt = TextStyle(
  fontFamily: 'DM Sans',
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  color: whiteColor,
);
var buttonText = TextStyle(
  fontFamily: 'DM Sans',
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  color: textColor,
);
var headlineText = TextStyle(
  fontFamily: 'DM Serif Display',
  fontSize: 24.0,
  color: whiteColor,
);
var bodyOneText = TextStyle(
  fontFamily: 'DM Sans',
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  color: textColor,
);