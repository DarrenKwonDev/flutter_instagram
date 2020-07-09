import 'package:com/screens/signin_page.dart';
import 'package:com/utils/simple_snack_bar.dart';
import 'package:com/widgets/sign_in_form.dart';
import 'package:com/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SignUpForm(),
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
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) => SignInPage());
          Navigator.push(context, route);
        },
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: TextStyle(), children: [
              TextSpan(
                  text: "Already have an acoount?",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black54)),
              TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[600])),
            ])),
      ),
    );
  }
}
