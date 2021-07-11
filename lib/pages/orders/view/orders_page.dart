import '../../../pages.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

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
                "Orders",
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutlinedButton(onPressed: () {}, child: Text("COLUMNS")),
              ),
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
                    DataColumn(label: Text('Order ID')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Order')),
                    DataColumn(label: Text('Customer')),
                    DataColumn(label: Text('Payment')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows: List.generate(
                      20,
                      (index) => buildDataRow(
                            orderID: 'OK12345',
                            date: DateTime.now(),
                            order: ['T-Shirt', 'Jeans'],
                            customer: 'Rickson Dpenha',
                            payment: 'Paid Online',
                            status: 'Pending',
                            total: '120',
                          )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow buildDataRow({
    required String orderID,
    required DateTime date,
    required List<String> order,
    required String customer,
    required String payment,
    required String status,
    required String total,
  }) {
    return DataRow(
      cells: [
        DataCell(Text(orderID)),
        DataCell(Text(date.toIso8601String())),
        DataCell(Text(order.toString())),
        DataCell(Text(customer)),
        DataCell(Text(payment)),
        DataCell(Text(status)),
        DataCell(Text(total)),
      ],
      onSelectChanged: (value) {},
      selected: false,
    );
  }
}
