import 'package:flutter/material.dart';
import 'package:share_songs/post.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Home Page"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Post();
          }),
      backgroundColor: Colors.black,
    );
  }
}
