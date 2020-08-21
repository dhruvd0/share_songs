import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share_songs/posts/post.dart';

class PostService {
  //push and pull post data
  AudioPlayer audioPlayer = AudioPlayer();

  ImagePicker imagePicker = ImagePicker();

  Future<File> pickFile() async {
    File file = await FilePicker.getFile();
    return file;
  }

  void uploadPost(String uid, String postName, String postText, File image,
      File audio) async {
    CollectionReference users =
        Firestore.instance.collection("users"); //users collection
    DocumentReference user = users.document(uid); //uid doc ref
    CollectionReference post =
        user.collection("Posts"); //posts collection of uid user
    DocumentReference doc = post.document(); //auto id genereted doc of post

    doc.setData({
      postName: {
        "postName": postName,
        "postText": postText,
      }
    });
    String postId = doc.documentID;
    StorageReference imageRef = FirebaseStorage.instance
        .ref()
        .child(uid + "/Posts/" + postId + "/image.jpg");
    StorageReference audioRef = FirebaseStorage.instance
        .ref()
        .child(uid + "/Posts/" + postId + "/audio.mp3");
    String imageLink = await imageRef.getDownloadURL();
    String audioLink = await imageRef.getDownloadURL();
    doc.updateData({
      postName: {
        "imageLink": imageLink,
        "audioLink": audioLink,
      },
    });
    imageRef.putFile(image);

    audioRef.putFile(audio);
  }

  void pauseAudio() async {
    audioPlayer.pause();
  }

  void playAudio() async {
    audioPlayer.play(
        "https://firebasestorage.googleapis.com/v0/b/share-songs-d7b4b.appspot.com/o/file?alt=media&token=246dce90-bebc-4904-855d-e8a8bc3c691c");
  }

  Stream<QuerySnapshot> posts(String uid) {
    CollectionReference users =
        Firestore.instance.collection("users"); //users collection
    DocumentReference user = users.document(uid); //uid doc ref
    CollectionReference posts =
        user.collection("Posts"); //posts collection of uid user

    return posts.snapshots();
  }

  void downloadPost() async {}
}
