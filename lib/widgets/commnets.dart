import 'package:cached_network_image/cached_network_image.dart';
import 'package:com/constants/size.dart';
import 'package:com/utils/profile_img_path.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String username;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;

  const Comment(
      {Key key,
      @required this.username,
      this.showProfile = false,
      this.dateTime,
      @required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                getProfileImgPath("username random")),
            radius: common_l_gap,
          ),
        ),
        Visibility(
          visible: showProfile,
          child: SizedBox(width: common_xs_gap),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                    TextSpan(
                      text: username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                      text: caption,
                    ),
                  ])),
              SizedBox(
                height: common_xxxs_gap,
              ),
              Visibility(
                visible: dateTime != null,
                child: dateTime == null
                    ? SizedBox()
                    : Text(dateTime.toIso8601String(), style: TextStyle(color: Colors.grey[600], fontSize: 10),
              )
              )],
          ),
        )
      ],
    );
  }
}
