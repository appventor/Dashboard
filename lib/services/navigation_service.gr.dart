// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import '../pages.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    Home.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.Home());
    },
    Login.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.Login());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<Home>(Home.name,
            path: '/', routeBuilder: (match) => Home.fromMatch(match)),
        _i1.RouteConfig<Login>(Login.name,
            path: '/login', routeBuilder: (match) => Login.fromMatch(match))
      ];
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: '/');

  Home.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'Home';
}

class Login extends _i1.PageRouteInfo {
  const Login() : super(name, path: '/login');

  Login.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'Login';
}
