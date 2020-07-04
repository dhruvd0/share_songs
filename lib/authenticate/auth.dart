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
    //auth user stream
    return firebaseAuth.onAuthStateChanged;
  }

  Future signInAnon() async {
    //sign in anonymously
    try {
      AuthResult authResult = await firebaseAuth.signInAnonymously();
      FirebaseUser user = authResult.user;

      return userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }
}
