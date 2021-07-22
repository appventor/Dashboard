import 'package:dashboard/pages/catalog/category/controller/delete_category.dart';
import 'package:dashboard/pages/catalog/category/controller/save_category_provider.dart';

import '../../../../../export.dart';
import '../../model/models.dart';
import '../../controller/categories_provider.dart';

class CategoriesDataTable extends StatefulWidget {
  const CategoriesDataTable({
    Key? key,
  }) : super(key: key);

  @override
  _CategoriesDataTableState createState() => _CategoriesDataTableState();
}

class _CategoriesDataTableState extends State<CategoriesDataTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Consumer(builder: (context, watch, child) {
              AsyncValue<List<Category>> categoriesData =
                  watch(categoriesProvider);
              return categoriesData.when(
                  data: (categories) {
                    return DataTable(
                      showCheckboxColumn: true,
                      onSelectAll: (value) {
                        for (Category category in categoriesData.data!.value) {
                          category.selected = value!;
                        }
                        setState(() {});
                      },
                      showBottomBorder: true,
                      columns: const [
                        DataColumn(label: Text('Image')),
                        DataColumn(label: Text('Title')),
                        DataColumn(label: Text('Sub-Category')),
                        DataColumn(label: Text('No of Products')),
                        DataColumn(label: Text('Options')),
                      ],
                      rows: categories
                          .map((category) => DataRow(
                                  onSelectChanged: (value) => setState(
                                      () => category.selected = value!),
                                  selected: category.selected,
                                  cells: [
                                    DataCell(Container(
                                      margin: const EdgeInsets.all(4),
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(category
                                                    .image ??
                                                'https://picsum.photos/640'),
                                          )),
                                    )),
                                    DataCell(Text(category.title)),
                                    DataCell(Text(category.subcategories.length
                                        .toString())),
                                    DataCell(Text(
                                        category.products.length.toString())),
                                    DataCell(PopupMenuButton(
                                      icon: const Icon(Icons.more_vert),
                                      onSelected: (value) {
                                        if (value == 0) {
                                          {
                                            context
                                                .read(categoryProvider)
                                                .state = category;
                                            context.navigateTo(
                                                CategoryDetailsRoute(
                                                    id: category.id));
                                          }
                                        } else if (value == 1) {
                                          context.read(
                                              deleteCategory(category.id));
                                        }
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
                                  ]))
                          .toList(),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) =>
                      const Center(child: CircularProgressIndicator()));
            }),
          )
        ],
      ),
    );
  }
}
