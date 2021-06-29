import 'package:dashboard/pages/catalog/category/view/widgets/add_category.dart';

import '../../../../pages.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Categories", style: Theme.of(context).textTheme.headline5),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search Categories'),
                ),
              )),
              ElevatedButton(
                  onPressed: () => addCategoryDialog(context),
                  child: Text("Add Category"))
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DataTable(
                    showCheckboxColumn: true,
                    onSelectAll: (value) {},
                    showBottomBorder: true,
                    columns: [
                      DataColumn(label: Text("Image")),
                      DataColumn(label: Text("Title")),
                      DataColumn(label: Text("Sub-Category")),
                      DataColumn(label: Text("No of Products")),
                    ],
                    rows: [
                      DataRow(onSelectChanged: (value) {}, cells: [
                        DataCell(Image.network("https://picsum.photos/106")),
                        DataCell(Text('Dairy')),
                        DataCell(Text('3')),
                        DataCell(Text('16')),
                      ])
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
