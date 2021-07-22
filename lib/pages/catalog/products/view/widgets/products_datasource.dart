import '../../../../../export.dart';
import '../../model/models.dart';
import '../../controller/delete_product.dart';
import '../../controller/save_product_provider.dart';

class ProductsDataSource extends DataTableSource {
  final BuildContext context;
  final List<Product> products;

  ProductsDataSource({required this.context, required this.products});

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= products.length) return null;
    final product = products[index];
    int stock = 10;
    // product.variants
    // .map((variant) => variant.inventory[0].stock)
    // .toList()
    // .reduce((value, element) => value + element);
    return DataRow.byIndex(
      index: index,
      selected: product.selected,
      onSelectChanged: (value) {
        if (product.selected != value && value != null) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          product.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Container(
          margin: const EdgeInsets.all(4),
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    NetworkImage(product.image ?? 'Https://picsum.photos/650'),
              )),
        )),
        DataCell(Text(product.title)),
        DataCell(Text(product.pricetag)),
        DataCell(Text(stock.toString())),
        DataCell(Text(product.variants.length.toString())),
        DataCell(PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 0) {
              {
                context.read(productProvider).state = product;
                context.navigateTo(ProductDetailsRoute(id: product.id));
              }
            } else if (value == 1) context.read(deleteProduct(product.id));
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 0,
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 1,
              child: Text('Delete'),
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get rowCount => products.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
