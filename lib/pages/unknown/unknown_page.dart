import 'package:dashboard/services/services.dart';
import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Oops! This is a wrong page.'),
            ElevatedButton(
              onPressed: () {
                context.router.push(const HomeRoute());
              },
              child: const Text('Go Home'),
            )
          ],
        ),
      ),
    );
  }
}
