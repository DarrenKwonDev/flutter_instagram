import 'package:com/constants/size.dart';
import 'package:com/main_page.dart';
import 'package:com/utils/simple_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset("assets/insta_text_logo.png"),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _emailController,
                decoration: getTextFieldDecor("Email"),
                validator: (value) {
                  if (value.isEmpty || !value.contains("@")) {
                    return "Please enter your email address!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _pwController,
                decoration: getTextFieldDecor("Password"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your email address!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text("Forgotten password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.blue[700], fontWeight: FontWeight.w700)),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _login;
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    height: 1,
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[50],
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton.icon(
                  textColor: Colors.blue,
                  onPressed: () {
                    simpleSnackBar(context, "facebook login!!");
                  },
                  icon: ImageIcon(AssetImage("assets/icon/facebook.png")),
                  label: Text("Login with Facebook")),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  get _login async {
    final AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _emailController.text, password: _pwController.text);

    final user = result.user;

    if (user == null) {
      simpleSnackBar(context, "Please try again later!");
    }
  }


  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 1),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 1),
            borderRadius: BorderRadius.circular(12)));
  }
}
