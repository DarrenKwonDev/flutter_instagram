import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:com/utils/simple_snack_bar.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void signInFacebook(context) async {
  final facebookLogin = FacebookLogin();
  final result = await facebookLogin.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      _handleFacebookToken(context, result.accessToken.token);
      break;
    case FacebookLoginStatus.cancelledByUser:
      simpleSnackBar(context, "Use cancel facebook sign in!");
      break;
    case FacebookLoginStatus.error:
      simpleSnackBar(context, "Error while facebook sign in!");
      break;
  }
}

void _handleFacebookToken(context, token) async {
  final AuthCredential credential = FacebookAuthProvider.getCredential(
    accessToken: token
  );
  final user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;

  print(user);

  if (user == null) {
    simpleSnackBar(context, "Fail to sign in with Facebook");
  }
}
