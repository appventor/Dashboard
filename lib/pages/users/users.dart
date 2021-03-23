import 'package:dashboard/services/services.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  final String id;

  const UsersPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[400],
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final String id;

  const UserDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green[900],
      child: Text("$id"),
    );
  }
}
