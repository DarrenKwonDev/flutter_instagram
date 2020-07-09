import 'package:com/screens/auth_page.dart';
import 'package:com/screens/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              final route = MaterialPageRoute(builder: (context) => AuthPage());
              Navigator.pushReplacement(context, route);
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
