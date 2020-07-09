import 'package:com/constants/material_white_color.dart';
import 'package:com/main_page.dart';
import 'package:com/screens/auth_page.dart';
import 'package:com/screens/signin_page.dart';
import 'package:flutter/material.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: white
      ),
      home: AuthPage()
    );
  }
}

// MainPage()는 테스트용
// 완성 후에는 아래 페이지로 변화시킬 것
// AuthPage()
