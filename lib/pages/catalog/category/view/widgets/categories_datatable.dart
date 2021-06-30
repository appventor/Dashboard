import '../../../../../pages.dart';
import '../../model/models.dart';
import '../../controller/categories_provider.dart';

class CategoriesDataTable extends StatelessWidget {
  const CategoriesDataTable({
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
      child: Row(
        children: [
          Expanded(
            child: Consumer(builder: (context, watch, child) {
              AsyncValue<List<Category>> categoriesData =
                  watch(categoriesProvider);
              return DataTable(
                showCheckboxColumn: true,
                onSelectAll: (value) {},
                showBottomBorder: true,
                columns: [
                  DataColumn(label: Text("Image")),
                  DataColumn(label: Text("Title")),
                  DataColumn(label: Text("Sub-Category")),
                  DataColumn(label: Text("No of Products")),
                ],
                rows: categoriesData.when(
                    data: (categories) {
                      return categories
                          .map((category) =>
                              DataRow(onSelectChanged: (value) {}, cells: [
                                DataCell(Image.network(category.image)),
                                DataCell(Text(category.title)),
                                DataCell(Text(
                                    category.subcategories.length.toString())),
                                DataCell(
                                    Text(category.products.length.toString())),
                              ]))
                          .toList();
                    },
                    loading: () => [
                          DataRow(cells: [
                            DataCell(Icon(Icons.warning)),
                            DataCell.empty,
                            DataCell.empty,
                            DataCell.empty,
                          ])
                        ],
                    error: (error, stackTrace) {
                      print(error);
                      return [
                        DataRow(cells: [
                          DataCell(Icon(Icons.warning)),
                          DataCell.empty,
                          DataCell.empty,
                          DataCell.empty,
                        ])
                      ];
                    }),
              );
            }),
          )
        ],
      ),
    );
  }
}
