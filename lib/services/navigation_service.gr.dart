// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'auth_guard.dart' as _i3;
import '../pages.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter({@_i2.required this.authGuard}) : assert(authGuard != null);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (entry) {
      return _i1.CustomPage(entry: entry, child: _i4.Home());
    },
    UnknownRoute.name: (entry) {
      return _i1.CustomPage(entry: entry, child: _i4.UnknownPage());
    },
    LoginRoute.name: (entry) {
      var route = entry.routeData.as<LoginRoute>();
      return _i1.CustomPage(
          entry: entry,
          child: _i4.Login(key: route.key, onLoginResult: route.onLoginResult),
          fullscreenDialog: false);
    },
    DashboardRoute.name: (entry) {
      return _i1.CustomPage(entry: entry, child: _i4.DashboardPage());
    },
    UsersRoute.name: (entry) {
      return _i1.CustomPage(entry: entry, child: const _i1.EmptyRouterPage());
    },
    SettingsRoute.name: (entry) {
      return _i1.CustomPage(entry: entry, child: _i4.SettingsPage());
    },
    UsersList.name: (entry) {
      var route = entry.routeData.as<UsersList>();
      return _i1.CustomPage(
          entry: entry, child: _i4.UsersPage(key: route.key, id: route.id));
    },
    UserDetails.name: (entry) {
      var route = entry.routeData.as<UserDetails>();
      return _i1.CustomPage(
          entry: entry,
          child: _i4.UserDetailsPage(key: route.key, id: route.id));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<HomeRoute>(HomeRoute.name,
            path: '/',
            routeBuilder: (match) => HomeRoute.fromMatch(match),
            guards: [
              authGuard
            ],
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
        _i1.RouteConfig<LoginRoute>(LoginRoute.name,
            path: '/login',
            routeBuilder: (match) => LoginRoute.fromMatch(match))
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  HomeRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'HomeRoute';
}

class UnknownRoute extends _i1.PageRouteInfo {
  const UnknownRoute() : super(name, path: '*');

  UnknownRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'UnknownRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  LoginRoute({this.key, this.onLoginResult}) : super(name, path: '/login');

  LoginRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        onLoginResult = null,
        super.fromMatch(match);

  final _i2.Key key;

  final void Function(bool) onLoginResult;

  static const String name = 'LoginRoute';
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

  final _i2.Key key;

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

  final _i2.Key key;

  final String id;

  static const String name = 'UserDetails';
}
