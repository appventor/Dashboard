import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        child: ListView(
          children: [
            if (Responsive.isMobile(context))
              ListTile(
                title: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 100,
                ),
              ),
            ListTile(
              leading: Icon(FontAwesomeIcons.chartLine),
              title: Text("Dashboard"),
              onTap: () => context.tabsRouter.setActiveIndex(0),
            ),
            ExpansionTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('Catalog'),
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.boxOpen),
                  title: Text('Products'),
                  onTap: () => context
                      .navigateTo(CatalogRoute(children: [ProductsRoute()])),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.boxes),
                  title: Text('Category'),
                  onTap: () => context
                      .navigateTo(CatalogRoute(children: [CategoryRoute()])),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.bookmark),
                  title: Text('Collection'),
                  onTap: () => context
                      .navigateTo(CatalogRoute(children: [CollectionsRoute()])),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(FontAwesomeIcons.shoppingCart),
              title: Text('Orders'),
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.newspaper),
                  title: Text('All Orders'),
                  onTap: () =>
                      context.navigateTo(OrdersRoute(children: [AllOrders()])),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.truckLoading),
                  title: Text('Active Orders'),
                  onTap: () => context
                      .navigateTo(OrdersRoute(children: [ActiveOrdersRoute()])),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.clipboardList),
                  title: Text('Pending Orders'),
                  onTap: () => context
                      .navigateTo(OrdersRoute(children: [PendingOrderRoute()])),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.clipboardCheck),
                  title: Text('Fulfilled Orders'),
                  onTap: () => context.navigateTo(
                      OrdersRoute(children: [FullfilledOrdersRoute()])),
                ),
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.users),
              title: Text("Customers"),
              onTap: () =>
                  context.navigateTo(UsersRoute(children: [UsersList()])),
            )
          ],
        ),
      ),
    );
  }
}
