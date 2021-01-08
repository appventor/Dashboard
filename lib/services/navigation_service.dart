import 'package:auto_route/auto_route.dart';
import '../pages.dart';
import 'auth_guard.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'HomeRoute',
      page: Home,
      guards: [AuthGuard],
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
    AutoRoute(
      page: Login,
      name: 'LoginRoute',
      path: "/login",
      fullscreenDialog: false,
    ),
  ],
)
class $AppRouter {}
