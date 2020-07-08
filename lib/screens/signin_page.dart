import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _gotoSignUpPageBtn(context),
          ],
        ),
      ),
    );
  }

  _gotoSignUpPageBtn(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        shape: Border(top: BorderSide(color: Colors.grey[300])),
        onPressed: null,
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: TextStyle(), children: [
              TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black54)),
              TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[600])),
            ])),
      ),
    );
  }
}
