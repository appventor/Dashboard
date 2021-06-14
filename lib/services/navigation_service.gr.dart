// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages.dart' as _i4;
import 'auth_guard.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.Home();
        },
        opaque: true,
        barrierDismissible: false),
    UnknownRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.UnknownPage();
        },
        opaque: true,
        barrierDismissible: false),
    LoginRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.Login();
        },
        opaque: true,
        barrierDismissible: false),
    DashboardRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.DashboardPage();
        },
        opaque: true,
        barrierDismissible: false),
    UsersRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        },
        opaque: true,
        barrierDismissible: false),
    SettingsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.SettingsPage();
        },
        opaque: true,
        barrierDismissible: false),
    UsersList.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<UsersListArgs>();
          return _i4.UsersPage(key: args.key, id: args.id);
        },
        opaque: true,
        barrierDismissible: false),
    UserDetails.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<UserDetailsArgs>();
          return _i4.UserDetailsPage(key: args.key, id: args.id);
        },
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          _i1.RouteConfig('#redirect',
              path: '', redirectTo: 'dashboard', fullMatch: true),
          _i1.RouteConfig(DashboardRoute.name, path: 'dashboard'),
          _i1.RouteConfig(UsersRoute.name, path: 'users', children: [
            _i1.RouteConfig('#redirect',
                path: '', redirectTo: 'list', fullMatch: true),
            _i1.RouteConfig(UsersList.name, path: 'list'),
            _i1.RouteConfig(UserDetails.name, path: 'list/:id')
          ]),
          _i1.RouteConfig(SettingsRoute.name, path: 'settings')
        ]),
        _i1.RouteConfig(UnknownRoute.name, path: '*'),
        _i1.RouteConfig(LoginRoute.name, path: '/login')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

class UnknownRoute extends _i1.PageRouteInfo {
  const UnknownRoute() : super(name, path: '*');

  static const String name = 'UnknownRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login');

  static const String name = 'LoginRoute';
}

class DashboardRoute extends _i1.PageRouteInfo {
  const DashboardRoute() : super(name, path: 'dashboard');

  static const String name = 'DashboardRoute';
}

class UsersRoute extends _i1.PageRouteInfo {
  const UsersRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'users', initialChildren: children);

  static const String name = 'UsersRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: 'settings');

  static const String name = 'SettingsRoute';
}

class UsersList extends _i1.PageRouteInfo<UsersListArgs> {
  UsersList({_i2.Key? key, required String id})
      : super(name, path: 'list', args: UsersListArgs(key: key, id: id));

  static const String name = 'UsersList';
}

class UsersListArgs {
  const UsersListArgs({this.key, required this.id});

  final _i2.Key? key;

  final String id;
}

class UserDetails extends _i1.PageRouteInfo<UserDetailsArgs> {
  UserDetails({_i2.Key? key, required String id})
      : super(name,
            path: 'list/:id',
            args: UserDetailsArgs(key: key, id: id),
            rawPathParams: {});

  static const String name = 'UserDetails';
}

class UserDetailsArgs {
  const UserDetailsArgs({this.key, required this.id});

  final _i2.Key? key;

  final String id;
}
