import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_songs/authenticate/auth.dart';
import 'package:share_songs/post.dart';
import 'package:share_songs/user.dart';

class Feed extends StatefulWidget {
  Auth auth = Auth(); //authentication service
  FirebaseUser user;
  Feed(FirebaseUser getUser) {
    if (getUser != null) {
      this.user = getUser;
    }
  }

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  String displayName = "Test";
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.user != null) {
      setState(() {
        displayName = widget.user.uid;
        String email = widget.user.email;
        if (email != null) {
          displayName += email;
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              displayName,
              style: TextStyle(fontSize: 10),
            ),
            FloatingActionButton(
              onPressed: () async {
                await widget.auth.signOut();
              },
              mini: true,
              child: Icon(Icons.person_outline),
              backgroundColor: Colors.black,
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return PostWidget();
          }),
      backgroundColor: Colors.black,
    );
  }
}
