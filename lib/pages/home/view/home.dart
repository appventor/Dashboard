import 'package:dashboard/pages/home/view/home_mobile.dart';
import 'package:dashboard/pages/widgets/responsive.dart';

import '../../../pages.dart';
import 'home_desktop.dart';
import 'home_tablet.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeMobile(),
      tablet: HomeTablet(),
      desktop: HomeDesktop(),
    );
  }
}
