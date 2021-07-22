import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../export.dart';
import '../category/model/models.dart';
import '../category/controller/categories_provider.dart';

class LinkCategories extends StatelessWidget {
  final List<String> initialValue;
  final String? excludeID;
  final Function onSelected;

  const LinkCategories({
    Key? key,
    required this.initialValue,
    this.excludeID,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Text('Link Categories'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Tooltip(
                message:
                    'You can add multiple sub-categories, to add create one first.',
                child: Icon(Icons.info, size: 18)),
          )
        ]),
        Consumer(builder: (context, watch, child) {
          AsyncValue<List<Category>> categoriesData = watch(categoriesProvider);
          return MultiSelectChipField(
              headerColor: Colors.transparent,
              searchable: true,
              title: const Text('Select Categories'),
              initialValue: initialValue,
              onTap: (value) => onSelected(value),
              items: categoriesData.when(
                  data: (categories) {
                    List<Category> cat = List.from(categories);
                    if (excludeID != null) {
                      cat.removeWhere((element) => element.id == excludeID);
                    }
                    return cat
                        .map(
                          (category) =>
                              MultiSelectItem(category.id, category.title),
                        )
                        .toList();
                  },
                  loading: () => [],
                  error: (_, __) => []));
        }),
      ],
    );
  }
}
