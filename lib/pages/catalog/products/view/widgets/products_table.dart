import '../../../../../pages.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({Key? key}) : super(key: key);

  DataRow buildDataRow({
    required String name,
    required String type,
    required String price,
    required String stock,
  }) {
    return DataRow(
      cells: [
        DataCell(Text(name)),
        DataCell(Text(type)),
        DataCell(Text(price)),
        DataCell(Text(stock)),
      ],
      onSelectChanged: (value) {},
      selected: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            showCheckboxColumn: true,
            onSelectAll: (value) {},
            showBottomBorder: true,
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Stock'))
            ],
            rows: List.generate(
                20,
                (index) => buildDataRow(
                    name: 'Mango',
                    type: 'Fruits',
                    price: '12$index',
                    stock: '10')),
          ),
        ),
      ),
    );
  }
}
