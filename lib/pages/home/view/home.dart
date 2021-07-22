import '../../../export.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        lazyLoad: true,
        routes: const [
          DashboardRoute(),
          CatalogRoute(),
          OrdersRoute(),
          UsersRoute(),
        ],
        drawer: Responsive.isMobile(context) ? const SideBar() : null,
        builder: (context, child, animation) {
          return Responsive.isMobile(context)
              ? Scaffold(
                  appBar: AppBar(
                    actions: const [
                      SelectWarehouse(),
                    ],
                  ),
                  body: child,
                )
              : Row(children: [
                  const SideBar(),
                  Expanded(
                    flex: 5,
                    child: Scaffold(
                      appBar: AppBar(
                        title: !Responsive.isMobile(context)
                            ? const FlutterLogo(
                                style: FlutterLogoStyle.horizontal,
                                size: 100,
                              )
                            : null,
                        centerTitle: false,
                        actions: const [
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
