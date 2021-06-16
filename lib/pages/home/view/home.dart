import '../../../pages.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        DashboardRoute(),
        CatalogRoute(),
        OrdersRoute(),
        UsersRoute(),
      ],
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: !Responsive.isMobile(context)
              ? FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 100,
                )
              : null,
          centerTitle: false,
          actions: [],
        );
      },
      drawer: Responsive.isMobile(context) ? SideBar() : null,
      builder: (context, child, animation) {
        return Responsive.isMobile(context)
            ? child
            : Row(children: [
                SideBar(),
                Expanded(
                  flex: 5,
                  child: child,
                ),
              ]);
      },
    );
  }
}
