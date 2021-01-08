import 'package:flutter/material.dart';
import 'services/services.dart';

// final _appRouter = AppRouter();

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter().delegate(),
      routeInformationParser: AppRouter().defaultRouteParser(),
    );
  }
}
