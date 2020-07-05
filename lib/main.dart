import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_songs/authenticate/auth.dart';
import 'package:share_songs/authenticate/signIn.dart';
import 'package:share_songs/post.dart';
import 'package:share_songs/feed.dart';
import 'package:share_songs/user.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: Auth().user, //user stream,
        child: MaterialApp(
          home: Wrapper(),
        ));
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(
        context); //gets user from stream on auth change
    if (user == null) {
      return SignIn();
    } else {
      return Feed(user);
    }
  }
}
