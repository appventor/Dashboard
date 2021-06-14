import 'package:dashboard/pages.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < mobileBreakpoint) {
          return Container(
            color: Colors.blue,
          );
        } else if (constraints.maxWidth > mobileBreakpoint &&
            constraints.maxWidth < tabletBreakpoint) {
          return Container(
            color: Colors.amber,
          );
        } else {
          return Scaffold(
            body: DashboardPage(),
          );
        }
      },
    );
  }
}
