import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class PostService {
  //push and pull post data
  AudioPlayer audioPlayer = AudioPlayer();

  ImagePicker imagePicker = ImagePicker();

  void uploadPost() async {
    
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child("file");
    File file = await FilePicker.getFile();

    StorageUploadTask upTask = storageReference.putFile(file);
  }

  void pauseAudio() async {
    audioPlayer.pause();
  }

  void playAudio() async {
    audioPlayer.play(
        "https://firebasestorage.googleapis.com/v0/b/share-songs-d7b4b.appspot.com/o/file?alt=media&token=246dce90-bebc-4904-855d-e8a8bc3c691c");
  }

  void downloadPost() async {}
}
