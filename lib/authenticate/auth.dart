import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  //handles firebase auth
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future signInAnon() async {
    //sign in anonymously
    try {
      AuthResult authResult = await firebaseAuth.signInAnonymously();
      FirebaseUser user = authResult.user;
      
      return user;
    } catch (e) {
      return null;
    }
  }
}
