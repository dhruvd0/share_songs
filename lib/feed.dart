import 'package:flutter/material.dart';
import 'package:share_songs/post.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Feed"),
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
