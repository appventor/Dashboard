// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import '../pages.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    Home.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.Home());
    },
    UnknownRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.UnknownPage());
    },
    Login.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.Login());
    },
    DashboardRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.DashboardPage());
    },
    UsersRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: const _i1.EmptyRouterPage());
    },
    SettingsRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.SettingsPage());
    },
    UsersList.name: (entry) {
      var route = entry.routeData.as<UsersList>();
      return _i1.MaterialPageX(
          entry: entry, child: _i2.UsersPage(key: route.key, id: route.id));
    },
    UserDetails.name: (entry) {
      var route = entry.routeData.as<UserDetails>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i2.UserDetailsPage(key: route.key, id: route.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<Home>(Home.name,
            path: '/',
            routeBuilder: (match) => Home.fromMatch(match),
            children: [
              _i1.RouteConfig('#redirect',
                  path: '', redirectTo: 'dashboard', fullMatch: true),
              _i1.RouteConfig<DashboardRoute>(DashboardRoute.name,
                  path: 'dashboard',
                  routeBuilder: (match) => DashboardRoute.fromMatch(match)),
              _i1.RouteConfig<UsersRoute>(UsersRoute.name,
                  path: 'users',
                  routeBuilder: (match) => UsersRoute.fromMatch(match),
                  children: [
                    _i1.RouteConfig('#redirect',
                        path: '', redirectTo: 'list', fullMatch: true),
                    _i1.RouteConfig<UsersList>(UsersList.name,
                        path: 'list',
                        routeBuilder: (match) => UsersList.fromMatch(match)),
                    _i1.RouteConfig<UserDetails>(UserDetails.name,
                        path: 'list/:id',
                        routeBuilder: (match) => UserDetails.fromMatch(match))
                  ]),
              _i1.RouteConfig<SettingsRoute>(SettingsRoute.name,
                  path: 'settings',
                  routeBuilder: (match) => SettingsRoute.fromMatch(match))
            ]),
        _i1.RouteConfig<UnknownRoute>(UnknownRoute.name,
            path: '*', routeBuilder: (match) => UnknownRoute.fromMatch(match)),
        _i1.RouteConfig<Login>(Login.name,
            path: '/login', routeBuilder: (match) => Login.fromMatch(match))
      ];
}

class Home extends _i1.PageRouteInfo {
  const Home({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  Home.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'Home';
}

class UnknownRoute extends _i1.PageRouteInfo {
  const UnknownRoute() : super(name, path: '*');

  UnknownRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'UnknownRoute';
}

class Login extends _i1.PageRouteInfo {
  const Login() : super(name, path: '/login');

  Login.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'Login';
}

class DashboardRoute extends _i1.PageRouteInfo {
  const DashboardRoute() : super(name, path: 'dashboard');

  DashboardRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'DashboardRoute';
}

class UsersRoute extends _i1.PageRouteInfo {
  const UsersRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: 'users', initialChildren: children);

  UsersRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'UsersRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: 'settings');

  SettingsRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'SettingsRoute';
}

class UsersList extends _i1.PageRouteInfo {
  UsersList({this.key, this.id}) : super(name, path: 'list');

  UsersList.fromMatch(_i1.RouteMatch match)
      : key = null,
        id = match.pathParams.getString('id'),
        super.fromMatch(match);

  final _i3.Key key;

  final String id;

  static const String name = 'UsersList';
}

class UserDetails extends _i1.PageRouteInfo {
  UserDetails({this.key, this.id})
      : super(name, path: 'list/:id', params: {'id': id});

  UserDetails.fromMatch(_i1.RouteMatch match)
      : key = null,
        id = match.pathParams.getString('id'),
        super.fromMatch(match);

  final _i3.Key key;

  final String id;

  static const String name = 'UserDetails';
}
