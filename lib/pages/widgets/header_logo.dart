import '../../export.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(
      style: FlutterLogoStyle.horizontal,
      size: 100,
    );
  }
}
