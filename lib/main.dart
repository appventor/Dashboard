import 'package:flutter/material.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        alignment: Alignment.center,
        child: Text(
            "Hello World! \nWe are going to build a beautiful Dashboard in Flutter."),
      ),
    );
  }
}
