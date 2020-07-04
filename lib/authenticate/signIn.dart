import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_songs/authenticate/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //sign in page

  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.grey[900], title: Text("Sign In")),
      body: Column(
        children: <Widget>[
          RaisedButton(
              onPressed: () async {
                dynamic user = await auth.signInAnon();
                if (user == null) {
                  print("Error");
                } else {
                  print(user);
                }
              },
              child: Text("Sign in")),
        ],
      ),
    );
  }
}
