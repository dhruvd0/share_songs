import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_songs/authenticate/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //sign in page
  String email = "";
  String pass = "";
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.grey[900], title: Text("Sign In")),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              //email
              style: TextStyle(color: Colors.white),
              onChanged: (val) {
                setState(() {
                  email = val.toString();
                });
              },
            ),
            TextFormField(
              //pass
              style: TextStyle(color: Colors.white),
              onChanged: (val) {
                setState(() {
                  pass = val.toString();
                });
              },
              obscureText: true,
            ),
            RaisedButton(
                onPressed: () async {
                  FirebaseUser user = await auth.signInAnon(email);

                
                },
                child: Text("Sign in")),
          ],
        ),
      ),
    );
  }
}
