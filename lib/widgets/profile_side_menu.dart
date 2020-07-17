import 'package:com/data/provider/my_user_data.dart';
import 'package:com/screens/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSideMEnu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey[300]))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Setting",
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold)),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
          FlatButton.icon(
            onPressed: () {
              Provider.of<MyUserData>(context, listen:false).clearUser();
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text("Logout",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
