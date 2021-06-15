// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages.dart' as _i3;

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
          return _i3.Home();
        },
        opaque: true,
        barrierDismissible: false),
    UnknownRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.UnknownPage();
        },
        opaque: true,
        barrierDismissible: false),
    LoginRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.Login();
        },
        opaque: true,
        barrierDismissible: false),
    DashboardRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.DashboardPage();
        },
        opaque: true,
        barrierDismissible: false),
    CatalogRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.EmptyRouterPage();
        },
        opaque: true,
        barrierDismissible: false),
    OrdersRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.EmptyRouterPage();
        },
        opaque: true,
        barrierDismissible: false),
    UsersRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.EmptyRouterPage();
        },
        opaque: true,
        barrierDismissible: false),
    SettingsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SettingsPage();
        },
        opaque: true,
        barrierDismissible: false),
    ProductsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ProductsPage();
        },
        opaque: true,
        barrierDismissible: false),
    ProductDetailsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<ProductDetailsRouteArgs>(
              orElse: () =>
                  ProductDetailsRouteArgs(id: pathParams.getString('id')));
          return _i3.ProductDetails(key: args.key, id: args.id);
        },
        opaque: true,
        barrierDismissible: false),
    CategoryRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.CategoryPage();
        },
        opaque: true,
        barrierDismissible: false),
    CategoryDetailsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<CategoryDetailsRouteArgs>(
              orElse: () =>
                  CategoryDetailsRouteArgs(id: pathParams.getString('id')));
          return _i3.CategoryDetails(key: args.key, id: args.id);
        },
        opaque: true,
        barrierDismissible: false),
    CollectionsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.CollectionsPage();
        },
        opaque: true,
        barrierDismissible: false),
    CollectionsDetailRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<CollectionsDetailRouteArgs>(
              orElse: () =>
                  CollectionsDetailRouteArgs(id: pathParams.getString('id')));
          return _i3.CollectionDetails(key: args.key, id: args.id);
        },
        opaque: true,
        barrierDismissible: false),
    AllOrders.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.OrdersPage();
        },
        opaque: true,
        barrierDismissible: false),
    ActiveOrdersRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ActiveOrders();
        },
        opaque: true,
        barrierDismissible: false),
    PendingOrderRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.PendingOrders();
        },
        opaque: true,
        barrierDismissible: false),
    FullfilledOrdersRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.FulfilledOrders();
        },
        opaque: true,
        barrierDismissible: false),
    OrderDetailsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<OrderDetailsRouteArgs>(
              orElse: () =>
                  OrderDetailsRouteArgs(id: pathParams.getString('id')));
          return _i3.OrderDetails(key: args.key, id: args.id);
        },
        opaque: true,
        barrierDismissible: false),
    UsersList.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.UsersPage();
        },
        opaque: true,
        barrierDismissible: false),
    UserDetails.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<UserDetailsArgs>(
              orElse: () => UserDetailsArgs(id: pathParams.getString('id')));
          return _i3.UserDetailsPage(key: args.key, id: args.id);
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
          _i1.RouteConfig(CatalogRoute.name, path: 'catalog', children: [
            _i1.RouteConfig('#redirect',
                path: '', redirectTo: 'products', fullMatch: true),
            _i1.RouteConfig(ProductsRoute.name, path: 'products'),
            _i1.RouteConfig(ProductDetailsRoute.name, path: 'products/:id'),
            _i1.RouteConfig(CategoryRoute.name, path: 'category'),
            _i1.RouteConfig(CategoryDetailsRoute.name, path: 'category/:id'),
            _i1.RouteConfig(CollectionsRoute.name, path: 'collections'),
            _i1.RouteConfig(CollectionsDetailRoute.name,
                path: 'collections/:id')
          ]),
          _i1.RouteConfig(OrdersRoute.name, path: 'orders', children: [
            _i1.RouteConfig('#redirect',
                path: '', redirectTo: 'all', fullMatch: true),
            _i1.RouteConfig(AllOrders.name, path: 'all'),
            _i1.RouteConfig(ActiveOrdersRoute.name, path: 'active'),
            _i1.RouteConfig(PendingOrderRoute.name, path: 'pending'),
            _i1.RouteConfig(FullfilledOrdersRoute.name, path: 'fulfilled'),
            _i1.RouteConfig(OrderDetailsRoute.name, path: 'order/:id')
          ]),
          _i1.RouteConfig(UsersRoute.name, path: 'users', children: [
            _i1.RouteConfig('#redirect',
                path: '', redirectTo: 'list', fullMatch: true),
            _i1.RouteConfig(UsersList.name, path: 'all'),
            _i1.RouteConfig(UserDetails.name, path: 'users/:id')
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

class CatalogRoute extends _i1.PageRouteInfo {
  const CatalogRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'catalog', initialChildren: children);

  static const String name = 'CatalogRoute';
}

class OrdersRoute extends _i1.PageRouteInfo {
  const OrdersRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'orders', initialChildren: children);

  static const String name = 'OrdersRoute';
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

class ProductsRoute extends _i1.PageRouteInfo {
  const ProductsRoute() : super(name, path: 'products');

  static const String name = 'ProductsRoute';
}

class ProductDetailsRoute extends _i1.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({_i3.Key? key, required String id})
      : super(name,
            path: 'products/:id',
            args: ProductDetailsRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.id});

  final _i3.Key? key;

  final String id;
}

class CategoryRoute extends _i1.PageRouteInfo {
  const CategoryRoute() : super(name, path: 'category');

  static const String name = 'CategoryRoute';
}

class CategoryDetailsRoute extends _i1.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({_i3.Key? key, required String id})
      : super(name,
            path: 'category/:id',
            args: CategoryDetailsRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'CategoryDetailsRoute';
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({this.key, required this.id});

  final _i3.Key? key;

  final String id;
}

class CollectionsRoute extends _i1.PageRouteInfo {
  const CollectionsRoute() : super(name, path: 'collections');

  static const String name = 'CollectionsRoute';
}

class CollectionsDetailRoute
    extends _i1.PageRouteInfo<CollectionsDetailRouteArgs> {
  CollectionsDetailRoute({_i3.Key? key, required String id})
      : super(name,
            path: 'collections/:id',
            args: CollectionsDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'CollectionsDetailRoute';
}

class CollectionsDetailRouteArgs {
  const CollectionsDetailRouteArgs({this.key, required this.id});

  final _i3.Key? key;

  final String id;
}

class AllOrders extends _i1.PageRouteInfo {
  const AllOrders() : super(name, path: 'all');

  static const String name = 'AllOrders';
}

class ActiveOrdersRoute extends _i1.PageRouteInfo {
  const ActiveOrdersRoute() : super(name, path: 'active');

  static const String name = 'ActiveOrdersRoute';
}

class PendingOrderRoute extends _i1.PageRouteInfo {
  const PendingOrderRoute() : super(name, path: 'pending');

  static const String name = 'PendingOrderRoute';
}

class FullfilledOrdersRoute extends _i1.PageRouteInfo {
  const FullfilledOrdersRoute() : super(name, path: 'fulfilled');

  static const String name = 'FullfilledOrdersRoute';
}

class OrderDetailsRoute extends _i1.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({_i3.Key? key, required String id})
      : super(name,
            path: 'order/:id',
            args: OrderDetailsRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.id});

  final _i3.Key? key;

  final String id;
}

class UsersList extends _i1.PageRouteInfo {
  const UsersList() : super(name, path: 'all');

  static const String name = 'UsersList';
}

class UserDetails extends _i1.PageRouteInfo<UserDetailsArgs> {
  UserDetails({_i3.Key? key, required String id})
      : super(name,
            path: 'users/:id',
            args: UserDetailsArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'UserDetails';
}

class UserDetailsArgs {
  const UserDetailsArgs({this.key, required this.id});

  final _i3.Key? key;

  final String id;
}
