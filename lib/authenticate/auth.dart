// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_songs/user.dart';

class Auth {
  //handles firebase auth
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User userFromFirebaseUser(FirebaseUser firebaseUser) {
    return User(uid: firebaseUser.uid);
  }

  Stream<FirebaseUser> get user {
    //auth user stream detects auth changes
    return firebaseAuth.onAuthStateChanged;
  }

  Future signOut() async {
    try {
      return await firebaseAuth.signOut(); //signs out current user
    } catch (e) {}
  }

  Future signInAnon(String email) async {
    //sign in anonymously
    try {
      AuthResult authResult = await firebaseAuth.signInAnonymously();
      FirebaseUser user = authResult.user;
      if(email==null){
        email="null email";
      }
      await user.updateEmail(email);
      return user;
    } catch (e) {
      return null;
    }
  }
}
