import '../../../../../pages.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Product Variants'),
              Spacer(),
              OutlinedButton.icon(
                icon: Icon(Icons.add),
                label: Text("Add Variant"),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: DataTable(
                  showCheckboxColumn: true,
                  checkboxHorizontalMargin: 16,
                  onSelectAll: (value) {},
                  columns: [
                    DataColumn(label: Text('Images')),
                    DataColumn(label: Text('Unit')),
                    DataColumn(label: Text('Value')),
                    DataColumn(label: Text('Price')),
                    DataColumn(label: Text('Stock')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell.empty,
                        DataCell.empty,
                        DataCell.empty,
                        DataCell.empty,
                        DataCell.empty,
                      ],
                      onSelectChanged: (value) {},
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
