import 'package:com/constants/size.dart';
import 'package:com/utils/profile_img_path.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {

  final List<String> users = List.generate(10, (index) => 'user $index');

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _item(users[index]);
        },
      separatorBuilder: (context, index) {
          return Divider(thickness: 1, color: Colors.grey[200]);
      }
    ),


    );
  }

  Widget _item(String user) {
    return ListTile(
      title: Text(user),
      subtitle: Text("this is $user bio."),
      leading: CircleAvatar(
        radius: profile_radius,
        backgroundImage: NetworkImage(
          getProfileImgPath(user)
        ),
      ),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          border: Border.all(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text("following", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]),),
      ),
    );
  }
}

