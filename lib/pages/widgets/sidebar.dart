import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool collapse = false;
  int currentIndex = 0;

  checkIfCollapsible() {
    collapse = !Responsive.isDesktop(context);
  }

  @override
  Widget build(BuildContext context) {
    checkIfCollapsible();
    return Drawer(
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
            leading: Icon(Icons.dashboard),
            title: !collapse ? Text("Dashboard") : SizedBox.shrink(),
            selected: currentIndex == 0 ? true : false,
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
              if (Responsive.isMobile(context)) context.router.pop();
              context.tabsRouter.setActiveIndex(0);
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: !collapse ? Text('Catalog') : SizedBox.shrink(),
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.boxOpen),
                title: !collapse ? Text('Products') : SizedBox.shrink(),
                selected: currentIndex == 1 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context.navigateTo(CatalogRoute(children: [ProductsRoute()]));
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.boxes),
                title: !collapse ? Text('Category') : SizedBox.shrink(),
                selected: currentIndex == 2 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context.navigateTo(CatalogRoute(children: [CategoryRoute()]));
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.bookmark),
                title: !collapse ? Text('Collection') : SizedBox.shrink(),
                selected: currentIndex == 3 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context
                      .navigateTo(CatalogRoute(children: [CollectionsRoute()]));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(FontAwesomeIcons.shoppingCart),
            title: !collapse ? Text('Orders') : SizedBox.shrink(),
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.newspaper),
                title: !collapse ? Text('All Orders') : SizedBox.shrink(),
                selected: currentIndex == 4 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 4;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context.navigateTo(OrdersRoute(children: [AllOrders()]));
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.truckLoading),
                title: !collapse ? Text('Active Orders') : SizedBox.shrink(),
                selected: currentIndex == 5 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 5;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context
                      .navigateTo(OrdersRoute(children: [ActiveOrdersRoute()]));
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.clipboardList),
                title: !collapse ? Text('Pending Orders') : SizedBox.shrink(),
                selected: currentIndex == 6 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 6;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context
                      .navigateTo(OrdersRoute(children: [PendingOrderRoute()]));
                },
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.clipboardCheck),
                title: !collapse ? Text('Fulfilled Orders') : SizedBox.shrink(),
                selected: currentIndex == 7 ? true : false,
                onTap: () {
                  setState(() {
                    currentIndex = 7;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context.navigateTo(
                      OrdersRoute(children: [FullfilledOrdersRoute()]));
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.users),
            title: !collapse ? Text("Customers") : SizedBox.shrink(),
            selected: currentIndex == 8 ? true : false,
            onTap: () {
              setState(() {
                currentIndex = 8;
              });
              if (Responsive.isMobile(context)) context.router.pop();
              context.navigateTo(UsersRoute(children: [UsersList()]));
            },
          )
        ],
      ),
    );
  }
}
