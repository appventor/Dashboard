import '../../../export.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        lazyLoad: true,
        routes: [
          DashboardRoute(),
          CatalogRoute(),
          OrdersRoute(),
          UsersRoute(),
        ],
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        builder: (context, child, animation) {
          return Responsive.isMobile(context)
              ? Scaffold(
                  appBar: AppBar(
                    actions: [
                      SelectWarehouse(),
                    ],
                  ),
                  body: child,
                )
              : Row(children: [
                  SideBar(),
                  Expanded(
                    flex: 5,
                    child: Scaffold(
                      appBar: AppBar(
                        title: !Responsive.isMobile(context)
                            ? FlutterLogo(
                                style: FlutterLogoStyle.horizontal,
                                size: 100,
                              )
                            : null,
                        centerTitle: false,
                        actions: [
                          SelectWarehouse(),
                          ProfileAvatar(),
                        ],
                      ),
                      body: child,
                    ),
                  ),
                ]);
        });
  }
}
