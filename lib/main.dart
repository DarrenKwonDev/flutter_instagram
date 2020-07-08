import 'package:com/constants/material_white_color.dart';
import 'package:com/main_page.dart';
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
      home: SignInPage()
    );
  }
}
