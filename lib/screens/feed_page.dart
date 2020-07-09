import 'package:com/constants/size.dart';
import 'package:com/utils/profile_img_path.dart';
import 'package:com/widgets/commnets.dart';
import 'package:com/widgets/my_progress_indicator.dart';
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
            return _postItem(index, context);
          }),
    );
  }

  Column _postItem(int index, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader("username $index"),
        _postImage(index),
        _postActions(),
        _postLikes(),
        _postCaption(context, index),
        _allComments()
      ],
    );
  }

  FlatButton _allComments() {
    return FlatButton(
      onPressed: () {},
      child: Text(
        "show all 18 comments",
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Padding _postCaption(context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Comment(
        username: "username $index",
//          showProfile: true,
        caption: "I like my new laptop soooooooooooooooooo much",
//          dateTime: DateTime.now()
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text("80likes", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Row _postActions() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/bookmark.png'),
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/comment.png'),
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/direct_message.png'),
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        Spacer(),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/heart_selected.png'),
            color: Colors.redAccent,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Row _postHeader(String username) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: CircleAvatar(
            radius: profile_radius,
            backgroundImage:
                CachedNetworkImageProvider(getProfileImgPath(username)),
          ),
        ),
        Expanded(child: Text(username)),
        IconButton(
          icon: Icon(Icons.more, color: Colors.black87),
          onPressed: () {},
        )
      ],
    );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$index/200/200",
      placeholder: (context, url) => MyProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}