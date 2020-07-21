import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:audioplayers/audio_cache.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_songs/posts/PostService.dart';
// import 'package:provider/provider.dart';
// import 'package:share_songs/authenticate/auth.dart';

// import 'package:share_songs/posts/post.dart';
// import 'package:share_songs/feed.dart';
// import 'package:share_songs/user.dart';

class uploadPostWidget extends StatefulWidget {
  @override
  _uploadPostWidgetState createState() => _uploadPostWidgetState();
}

class _uploadPostWidgetState extends State<uploadPostWidget> {
  File audioFile, songArtFile;
  String postName = "null";
  String postText = "null";
  String hintText = "";
  TextStyle hintStyle = TextStyle(color: Colors.white60, fontSize: 10);
  CollectionReference collectionReference =
      Firestore.instance.collection("data");
  PostService postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "Audio Name",
              hintStyle: hintStyle,
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              setState(() {
                postName = text;
              });
            },
          ),
          TextFormField(
            decoration:
                InputDecoration(hintText: "Post Text", hintStyle: hintStyle),
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              setState(() {
                postText = text;
              });
            },
          ),
          FloatingActionButton(
            mini: true,
            child: Icon(Icons.image),
            backgroundColor: Colors.grey[900],
            onPressed: () async {
              setState(() async {
                songArtFile = await postService.pickFile();
              });
            },
          ),
          FloatingActionButton(
            mini: true,
            child: Icon(Icons.audiotrack),
            backgroundColor: Colors.grey[900],
            onPressed: () async {
              setState(() async {
                audioFile = await postService.pickFile();
              });
            },
          ),
          RaisedButton(
            color: Colors.grey[900],
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (postName == "null" || postText == "null") {
                setState(() {
                  hintStyle = TextStyle(color: Colors.red, fontSize: 10);
                });
              } else {
                postService.uploadPost(
                    "XYZ", postName, postText, songArtFile, audioFile);
              }
            },
          )
        ],
      )),
    );
  }
}
