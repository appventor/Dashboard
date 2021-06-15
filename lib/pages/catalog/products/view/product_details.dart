import '../../../../pages.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  const ProductDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
