import 'package:com/utils/profile_img_path.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/insta_text_logo.png", height: 26),
        leading: IconButton(
          icon: ImageIcon(
            AssetImage("assets/actionbar_camera.png"),
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/actionbar_camera.png"),
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/direct_message.png"),
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _postItem(index);
          }),
    );
  }

  Column _postItem(int index) {
    return Column(
            children: <Widget>[
              _postHeader("username $index"),
              _postImage(index),
            ],
          );
  }

  Row _postHeader(String username) {
    return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: CachedNetworkImageProvider(
                        getProfileImgPath(username)
                    ),
                  ),
                ),
                Expanded(child: Text(username)),
                IconButton(
                  icon: Icon(Icons.more, color: Colors.black87), onPressed: () {  },
                )
              ],
            );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
                imageUrl: "https://picsum.photos/id/$index/200/200",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ),
              );
  }
}
