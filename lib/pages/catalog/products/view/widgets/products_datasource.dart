import '../../../../../pages.dart';
import '../../model/models.dart';

class ProductsDataSource extends DataTableSource {
  ProductsDataSource(this.context) {
    _rows = <Product>[
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
      Product.fromMap(productJsonSchema),
    ];
  }

  final BuildContext context;
  late List<Product> _rows;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value && value != null) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Image.network(
          row.image,
          width: 50,
        )),
        DataCell(Text(row.title)),
        DataCell(Text(row.pricetag)),
        DataCell(Text(row.stock.toString())),
        DataCell(Text(row.variants.length.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
