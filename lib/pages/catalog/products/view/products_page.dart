import '../../../../pages.dart';
import 'widgets/products_table.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Products",
                style: Theme.of(context).textTheme.headline5,
              ),
              ElevatedButton(onPressed: () {}, child: Text("CREATE PRODUCT")),
            ],
          ),
          ProductsTable()
        ],
      ),
    );
  }
}
