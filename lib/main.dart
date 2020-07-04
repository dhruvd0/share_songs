import 'package:flutter/material.dart';
import 'package:share_songs/authenticate/auth.dart';
import 'package:share_songs/authenticate/signIn.dart';
import 'package:share_songs/post.dart';
import 'package:share_songs/feed.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) {
        return StartWidget(
          start: Feed(),
        );
      },
      "/feed": (context) {
        return Feed();
      },
      "/signIn": (context) {
        return SignIn();
      },
    },
  ));
}

class StartWidget extends StatelessWidget {
  Widget start;
  StartWidget({this.start});
  @override
  Widget build(BuildContext context) {
    return start;
  }
}
