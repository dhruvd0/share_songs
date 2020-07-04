import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String artLink =
      "https://images.unsplash.com/photo-1458560871784-56d23406c091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80";
  String audioName, userName, postText;
  @override
  initState() {
    super.initState();
    audioName = "Numb";
    userName = "linkinpark";
    postText = '''I'm tired of being what you want me to be
Feeling so faithless, lost under the surface
I don't know what you're expecting of me
Put under the pressure of walking in your shoes
Caught in the undertow, just caught in the undertow
Every step that I take is another mistake to you
Caught in the undertow, just caught in the undertow''';
  }

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: (){},
          mini: true,
          backgroundColor: Colors.grey[850],
          child: Icon(
            Icons.replay_10,
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.grey[850],
          mini: true,
          child: Icon(Icons.play_arrow),
          onPressed: () {},
        ),
        FloatingActionButton(
          onPressed: (){},
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
      //post container
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
                "$userName",
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
                          image: NetworkImage(artLink), fit: BoxFit.fill)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        "$audioName",
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
                  onPressed: (){},
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
                    "$userName",
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
                    '''$postText''',
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
