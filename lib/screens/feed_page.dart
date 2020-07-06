import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Instagram"), actions: <Widget>[
          ImageIcon(AssetImage("assets/actionbar_camera.png")),
          ImageIcon(AssetImage("assets/direct_message.png")),
        ]),
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 300,
                color: Colors.primaries[index % Colors.primaries.length]
              );
            }));
  }
}
