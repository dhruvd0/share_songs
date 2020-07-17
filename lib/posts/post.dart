// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_songs/posts/PostService.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:share_songs/posts/PostService.dart';

class Post {
  String songArtLink;
  String userName, postText, audioName;
  String uid;
  String audioLength;//in minutes
  Post({this.postText, this.userName, this.songArtLink, this.audioName});
}

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isPlaying = false;
  PostService postService = PostService();
  Post post = Post(
      postText: "Post text",
      songArtLink: "assets/testImage.jpg",
      userName: "linkinpark",audioName: "Numb");

  Icon play_pauseIcon = Icon(Icons.play_arrow);
  @override
  initState() {
    super.initState();
  }

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          //back
          onPressed: () {},
          mini: true,
          backgroundColor: Colors.grey[850],
          child: Icon(
            Icons.replay_10,
          ),
        ),
        FloatingActionButton(
          //play/pause
          backgroundColor: Colors.grey[850],
          mini: true,
          child: play_pauseIcon,
          onPressed: () {
            if (!isPlaying) {
              postService.playAudio();
              setState(() {
                isPlaying = true;
                play_pauseIcon = Icon(Icons.pause);
              });
            } else {
              postService.pauseAudio();
              setState(() {
                isPlaying = false;
                play_pauseIcon = Icon(Icons.play_arrow);
              });
            }
          },
        ),
        FloatingActionButton(
          //next
          onPressed: () {},
          mini: true,
          backgroundColor: Colors.grey[850],
          child: Icon(Icons.forward_10),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //PostWidget container
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            //user icon and id
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              Text(
                post.userName,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            //user content
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //music art container

                  height: 180.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(post.songArtLink),
                          fit: BoxFit.fill)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        post.audioName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      "00:00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(child: actionButtons()),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                    heroTag: "one",
                    onPressed: () {},
                    mini: true,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    post.userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    post.postText,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
