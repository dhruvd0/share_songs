import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:audioplayers/audio_cache.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  String uploadPostName = "post";

  CollectionReference collectionReference =
      Firestore.instance.collection("data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: Form(
          child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: "Audio Name",
                hintStyle: TextStyle(color: Colors.white60, fontSize: 10)),
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              setState(() {
                uploadPostName = text;
              });
            },
          ),
          RaisedButton(
            onPressed: () async {
              CollectionReference collectionReference =
                  Firestore.instance.collection("data/"+uploadPostName);

              collectionReference
                  .document("data/" + uploadPostName)
                  .setData({"postName": uploadPostName});
            },
          )
        ],
      )),
    );
  }
}
