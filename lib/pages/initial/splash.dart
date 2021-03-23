import 'dart:async';

import 'package:dashboard/services/services.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final Function loaded;

  const Splash({Key? key, required this.loaded}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    handleStartupLogic();
    super.initState();
  }

  void handleStartupLogic() {
    Timer((const Duration(milliseconds: 900)), () {
      widget.loaded(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
