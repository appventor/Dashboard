import 'package:dashboard/services/services.dart';
import 'package:flutter/material.dart';

class SideMenuItem {
  final PageRouteInfo destination;
  final IconData iconData;
  final String label;

  const SideMenuItem({
    @required this.destination,
    @required this.iconData,
    @required this.label,
  });
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
