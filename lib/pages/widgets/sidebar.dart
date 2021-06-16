import 'package:dashboard/pages/widgets/header_logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  bool collapse = false;
  int currentIndex = 0;

  late Animation<double> _toggleAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _toggleAnimation =
        CurvedAnimation(curve: Curves.linear, parent: _controller);
  }

  checkIfCollapsible() {
    collapse = !Responsive.isDesktop(context) && !Responsive.isMobile(context);
  }

  @override
  Widget build(BuildContext context) {
    // checkIfCollapsible();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: collapse ? 100 : 210,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey.withOpacity(0.8),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3)),
          ],
          borderRadius: BorderRadius.only(
              topRight: const Radius.circular(10),
              bottomRight: const Radius.circular(10)),
          color: Colors.amber),
      child: ListView(
        // shrinkWrap: true,
        children: [
          if (Responsive.isMobile(context)) HeaderLogo(),
          IconButton(
            onPressed: () {
              setState(() {
                collapse = !collapse;
                if (collapse)
                  _controller.forward();
                else
                  _controller.reverse();
              });
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.arrow_menu,
              progress: _toggleAnimation,
            ),
          ),
          SideBarItem(
              collapsed: collapse,
              selected: currentIndex == 0 ? true : false,
              title: 'Dashboard',
              icon: Icons.dashboard,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                if (Responsive.isMobile(context)) context.router.pop();
                context.tabsRouter.setActiveIndex(0);
              }),
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined),
                if (collapse)
                  Text(
                    "Catalog",
                    style: TextStyle(fontSize: 10),
                  )
              ],
            ),
            title: !collapse
                ? Text(
                    'Catalog',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  )
                : SizedBox.shrink(),
            children: [
              SideBarItem(
                  collapsed: collapse,
                  selected: currentIndex == 1 ? true : false,
                  title: 'Products',
                  icon: FontAwesomeIcons.boxOpen,
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                    if (Responsive.isMobile(context)) context.router.pop();
                    context
                        .navigateTo(CatalogRoute(children: [ProductsRoute()]));
                  }),
              SideBarItem(
                  collapsed: collapse,
                  selected: currentIndex == 2 ? true : false,
                  title: 'Category',
                  icon: FontAwesomeIcons.boxes,
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                    if (Responsive.isMobile(context)) context.router.pop();
                    context
                        .navigateTo(CatalogRoute(children: [CategoryRoute()]));
                  }),
              SideBarItem(
                  collapsed: collapse,
                  selected: currentIndex == 3 ? true : false,
                  title: 'Collection',
                  icon: FontAwesomeIcons.bookmark,
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                    if (Responsive.isMobile(context)) context.router.pop();
                    context.navigateTo(
                        CatalogRoute(children: [CollectionsRoute()]));
                  })
            ],
          ),
          ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.shoppingCart),
                if (collapse)
                  Text(
                    "Orders",
                    style: TextStyle(fontSize: 10),
                  )
              ],
            ),
            title: !collapse
                ? Text(
                    'Orders',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  )
                : SizedBox.shrink(),
            children: [
              SideBarItem(
                  collapsed: collapse,
                  selected: currentIndex == 4 ? true : false,
                  title: 'All Orders',
                  icon: FontAwesomeIcons.newspaper,
                  onTap: () {
                    setState(() {
                      currentIndex = 4;
                    });
                    if (Responsive.isMobile(context)) context.router.pop();
                    context.navigateTo(OrdersRoute(children: [AllOrders()]));
                  }),
              SideBarItem(
                  collapsed: collapse,
                  selected: currentIndex == 5 ? true : false,
                  title: 'Active',
                  icon: FontAwesomeIcons.truckMoving,
                  onTap: () {
                    setState(() {
                      currentIndex = 5;
                    });
                    if (Responsive.isMobile(context)) context.router.pop();
                    context.navigateTo(
                        OrdersRoute(children: [ActiveOrdersRoute()]));
                  }),
              SideBarItem(
                  collapsed: collapse,
                  selected: currentIndex == 6 ? true : false,
                  title: 'Pending',
                  icon: FontAwesomeIcons.clipboardList,
                  onTap: () {
                    setState(() {
                      currentIndex = 6;
                    });
                    if (Responsive.isMobile(context)) context.router.pop();
                    context.navigateTo(
                        OrdersRoute(children: [PendingOrderRoute()]));
                  }),
              SideBarItem(
                collapsed: collapse,
                selected: currentIndex == 7 ? true : false,
                title: 'Fulfilled ',
                icon: FontAwesomeIcons.clipboardCheck,
                onTap: () {
                  setState(() {
                    currentIndex = 7;
                  });
                  if (Responsive.isMobile(context)) context.router.pop();
                  context.navigateTo(
                      OrdersRoute(children: [FullfilledOrdersRoute()]));
                },
              )
            ],
          ),
          SideBarItem(
              collapsed: collapse,
              selected: currentIndex == 8 ? true : false,
              title: 'Customers',
              icon: FontAwesomeIcons.users,
              onTap: () {
                setState(() {
                  currentIndex = 8;
                });
                if (Responsive.isMobile(context)) context.router.pop();
                context.navigateTo(UsersRoute(children: [UsersList()]));
              })
        ],
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  final bool collapsed, selected;
  final String title;
  final IconData icon;
  final Function onTap;
  const SideBarItem({
    Key? key,
    required this.collapsed,
    required this.selected,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        minLeadingWidth: 50,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
            ),
            if (collapsed)
              Text(
                title,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              )
          ],
        ),
        title: !collapsed
            ? Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.fade,
              )
            : SizedBox.shrink(),
        selected: selected,
        onTap: () => onTap(),
      ),
    );
  }
}
