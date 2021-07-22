import 'package:dashboard/pages/catalog/products/controller/products_provider.dart';
import 'package:dashboard/pages/catalog/products/controller/save_product_provider.dart';
import 'package:dashboard/pages/catalog/products/model/models.dart';

import '../../../../../export.dart';
import 'products_datasource.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      Products productsData = watch(productsProvider);
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PaginatedDataTable(
            source: ProductsDataSource(
                context: context, products: productsData.products),
            headingRowHeight: 60,
            header: Row(
              children: [
                Text('Products', style: Theme.of(context).textTheme.headline5),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Search Products'),
                  ),
                )),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    //  context.read(productsProvider.notifier).getProducts();
                    context.refresh(productsProvider.notifier).refresh();
                  },
                  icon: Icon(
                    Icons.refresh,
                  )),
              ElevatedButton(
                onPressed: () {
                  context.navigateTo(ProductDetailsRoute(
                      id: context.read(productProvider).state.id));
                },
                child: Text("Add Product"),
              ),
            ],
            rowsPerPage: 10,
            columns: [
              DataColumn(label: Text('Image')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Stock')),
              DataColumn(label: Text('Variants')),
              DataColumn(label: Text('Options')),
            ],
            onPageChanged: (value) {
              context
                  .read(productsProvider.notifier)
                  .handleScrollWithIndex(value);
            },
          ),
        ),
      );
    });
  }
}
