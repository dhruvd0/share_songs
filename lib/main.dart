

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:share_songs/authenticate/auth.dart';
import 'package:share_songs/authenticate/signIn.dart';
import 'package:share_songs/feed.dart';
import 'package:share_songs/posts/post.dart';
import 'package:share_songs/posts/uploadPost.dart';
// import 'package:share_songs/posts/post.dart';
// import 'package:share_songs/feed.dart';
// import 'package:share_songs/user.dart';

void main() {
  runApp(
    MaterialApp(
      home: Feed(),
      routes: {
        "/upload": (context) {
          return uploadPostWidget();
        }
      },
    ),
  );
}
