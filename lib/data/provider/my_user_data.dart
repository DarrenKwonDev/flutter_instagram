import 'package:com/data/user.dart';
import 'package:flutter/material.dart';

class MyUserData extends ChangeNotifier {
  User _myUserData;

  User get data => _myUserData;
  void setuserData(User user) {
    _myUserData = user;
    notifyListeners();
  }

  void clearUser() {
    _myUserData = null;
  }
}