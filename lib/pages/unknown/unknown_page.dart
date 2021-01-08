import 'package:dashboard/services/services.dart';
import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Oops! This is a wrong page."),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              child: Text("Go Home"),
            )
          ],
        ),
      ),
    );
  }
}
