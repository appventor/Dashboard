import '../../../pages.dart';

class OrderDetails extends StatelessWidget {
  final String id;
  const OrderDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
