import 'package:dashboard/pages/catalog/category/controller/save_category_provider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../pages.dart';
import '../category/model/models.dart';
import '../category/controller/categories_provider.dart';

class LinkCategories extends StatelessWidget {
  const LinkCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text('Add Sub-Categories'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tooltip(
                message:
                    'You can add multiple sub-categories, to add create one first.',
                child: Icon(Icons.info, size: 18)),
          )
        ]),
        Consumer(builder: (context, watch, child) {
          List<Category>? categories = watch(categoriesProvider).data?.value;
          return MultiSelectChipField(
            headerColor: Colors.transparent,
            searchable: true,
            title: Text('Select Categories'),
            onTap: (value) {
              print(value);
              context.read(categorySubcategories).state =
                  value.map((items) => items.toString()).toList();
            },
            items: categories != null
                ? categories
                    .map(
                      (category) =>
                          MultiSelectItem(category.id, category.title),
                    )
                    .toList()
                : [],
          );
        }),
      ],
    );
  }
}
