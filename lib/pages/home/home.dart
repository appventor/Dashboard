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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _sideMenuItems = const <SideMenuItem>[
    SideMenuItem(
      destination: DashboardRoute(),
      iconData: Icons.dashboard,
      label: 'Dashboard',
    ),
    SideMenuItem(
      destination: UsersRoute(),
      iconData: Icons.person,
      label: 'Users',
    ),
    SideMenuItem(
      destination: SettingsRoute(),
      iconData: Icons.settings,
      label: 'Settings',
    )
  ];

  Widget buildSideMenu(BuildContext context) {
    final router = context.router;
    return SizedBox(
      width: 240,
      child: Card(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: _sideMenuItems
                .map((item) => ListTile(
                      leading: Icon(item.iconData),
                      selected:
                          item.destination.routeName == router.current?.name,
                      title: Text(item.label),
                      onTap: () => router.navigate(item.destination),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoRouter(builder: (context, child) {
      return Scaffold(
          body: Row(
        children: [
          buildSideMenu(context),
          Expanded(child: child),
        ],
      ));
    });
  }
}
