import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_songs/authenticate/auth.dart';
import 'package:share_songs/posts/PostService.dart';
import 'package:share_songs/posts/post.dart';
import 'package:share_songs/user.dart';

// import 'package:share_songs/user.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// ignore: must_be_immutable
class Feed extends StatefulWidget {
  // Auth auth = Auth(); //authentication service
  // FirebaseUser user;
  // Feed(FirebaseUser getUser) {
  //   if (getUser != null) {
  //     this.user = getUser;
  //   }
  // }

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PostService postService = PostService();
  String displayName = "User Feed";
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              displayName,
              style: TextStyle(fontSize: 10),
            ),
            FloatingActionButton(
              onPressed: () async {},
              mini: true,
              child: Icon(Icons.person_outline),
              backgroundColor: Colors.black,
            ),
            Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return PostWidget();
          }),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        heroTag: "uploadBtn",
        child: Icon(Icons.add_circle),
        onPressed: () async {
          Navigator.popAndPushNamed(context, "/upload");
        },
      ),
    );
  }
}
