import '../../../../pages.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Products",
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: OutlinedButton(onPressed: () {}, child: Text("COLUMNS")),
              // ),
              ElevatedButton(onPressed: () {}, child: Text("CREATE PRODUCT")),
            ],
          ),
          Expanded(
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
          ),
        ],
      ),
    );
  }

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
}
