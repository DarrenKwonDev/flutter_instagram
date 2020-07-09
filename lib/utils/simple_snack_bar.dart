import 'package:flutter/material.dart';

void simpleSnackBar(context, txt) {
  final snackBar = SnackBar(content: Text(txt));
  Scaffold.of(context).showSnackBar(snackBar);
}