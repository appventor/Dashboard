import 'package:auto_route/auto_route.dart';

import '../pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: Login, path: "/login"),
  ],
)
class $AppRouter {}
