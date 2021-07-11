import '../pages.dart';

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
          path: 'catalog',
          page: EmptyRouterPage,
          name: 'CatalogRoute',
          children: [
            RedirectRoute(path: '', redirectTo: 'products'),
            AutoRoute(
              path: 'products',
              name: "ProductsRoute",
              page: ProductsPage,
            ),
            AutoRoute(
              path: 'products/:id',
              name: 'ProductDetailsRoute',
              page: ProductDetails,
            ),
            AutoRoute(
              path: 'category',
              name: "CategoryRoute",
              page: CategoryPage,
            ),
            AutoRoute(
              path: 'category/:id',
              name: 'CategoryDetailsRoute',
              page: CategoryDetails,
            ),
            AutoRoute(
              path: 'collections',
              name: "CollectionsRoute",
              page: CollectionsPage,
            ),
            AutoRoute(
              path: 'collections/:id',
              name: 'CollectionsDetailRoute',
              page: CollectionDetails,
            ),
          ],
        ),
        AutoRoute(
          path: 'orders',
          page: EmptyRouterPage,
          name: 'ordersRoute',
          children: [
            AutoRoute(
              path: '',
              name: "AllOrders",
              page: OrdersPage,
            ),
            AutoRoute(
              path: 'active',
              name: "ActiveOrdersRoute",
              page: ActiveOrders,
            ),
            AutoRoute(
              path: 'pending',
              name: "PendingOrderRoute",
              page: PendingOrders,
            ),
            AutoRoute(
              path: 'fulfilled',
              name: "FullfilledOrdersRoute",
              page: FulfilledOrders,
            ),
            AutoRoute(
              path: ':id',
              name: 'OrderDetailsRoute',
              page: OrderDetails,
            ),
          ],
        ),
        AutoRoute(
          path: 'users',
          page: EmptyRouterPage,
          name: 'usersRoute',
          children: [
            RedirectRoute(path: '*', redirectTo: ''),
            AutoRoute(
              path: '',
              name: "UsersList",
              page: UsersPage,
            ),
            AutoRoute(
              path: ':id',
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
