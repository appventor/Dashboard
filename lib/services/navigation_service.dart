import 'package:auto_route/auto_route.dart';

import '../pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: Home,
      children: [
        RedirectRoute(path: '', redirectTo: 'dashboard'),
        AutoRoute(path: 'dashboard', page: DashboardPage),
        AutoRoute(
          path: 'users',
          page: EmptyRouterPage,
          name: 'usersRoute',
          children: [
            RedirectRoute(path: '', redirectTo: 'list'),
            AutoRoute(
              path: 'list',
              name: "UsersList",
              page: UsersPage,
            ),
            AutoRoute(
              path: 'list/:id',
              name: 'UserDetails',
              page: UserDetailsPage,
            ),
          ],
        ),
        AutoRoute(path: 'settings', page: SettingsPage),
      ],
    ),
    AutoRoute(path: '*', page: UnknownPage),
    AutoRoute(page: Login, path: "/login"),
  ],
)
class $AppRouter {}
