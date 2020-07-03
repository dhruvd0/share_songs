import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String artLink =
      "https://images.unsplash.com/photo-1458560871784-56d23406c091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80";

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          mini: true,
          child: Icon(
            Icons.skip_previous,
          ),
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.play_arrow),
          onPressed: () {},
        ),
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.skip_next),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Card(
        color: Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(child: Image.network(artLink)),
            Text(
              "SongName",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: actionButtons()),
          ],
        ),
      ),
    );
  }
}
