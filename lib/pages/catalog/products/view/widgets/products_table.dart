import '../../../../../pages.dart';
import 'products_datasource.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        source: ProductsDataSource(context),
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
              onPressed: () {},
              icon: Icon(
                Icons.delete,
              )),
          ElevatedButton(
            onPressed: () => context.navigateTo(
                ProductDetailsRoute(id: context.read(firestoreIdProvider))),
            child: Text("Add Product"),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
              )),
        ],
        rowsPerPage: 10,
        columns: [
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Stock')),
          DataColumn(label: Text('Variants')),
        ],
        onPageChanged: (value) {},
      ),
    );
  }
}
