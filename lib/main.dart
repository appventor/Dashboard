import 'package:flutter/material.dart';
import 'services/services.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  final appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
