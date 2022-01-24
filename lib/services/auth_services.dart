import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lingo_app/screens/home.dart';
import 'package:lingo_app/screens/onboarding_screen.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;


  //Create user object based on firebaseUser
  //Sign out user
  static void signOut(BuildContext context) {
    _auth.signOut();
      Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
  }

  static void signInUser(BuildContext context, String email, String password) async{
      _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  //Sign up User with Name, Email, Username and Password
  static void registerUser(BuildContext context, String name, String email, String password, String username) async {
    try{
     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     User user = result.user;
     if(user != null){
       _firestore.collection("/users").doc(user.uid).set({
         'name' : name,
         'email': email,
         'password': password,
         'username': username,
         'languageType': "Igbo",
         'profile_url': ''
       });
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
     }
      //return registerUser(user);
    }catch (e){

    }
  }
}