import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final void Function(bool isLoggedIn) onLoginResult;

  const Login({Key key, this.onLoginResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to continue'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () {
            onLoginResult?.call(true);
          },
        ),
      ),
    );
  }
}
