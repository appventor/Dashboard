import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../../pages.dart';
import '../model/models.dart';
import '../controller/categories_provider.dart';
import 'widgets/general_information.dart';

class CategoryDetails extends StatelessWidget {
  final String id;
  const CategoryDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text('Create Category',
                  style: Theme.of(context).textTheme.headline6),
            ]),
            Divider(),
            GeneralInformation(),
            Divider(),
            Row(
              children: [
                Text('Link to Category'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tooltip(
                      message:
                          'Linking to another category will make this a sub-category',
                      child: Icon(
                        Icons.info,
                        size: 18,
                      )),
                )
              ],
            ),
            Consumer(builder: (context, watch, child) {
              List<Category>? categories =
                  watch(categoriesProvider).data?.value;
              return MultiSelectChipField(
                headerColor: Colors.transparent,
                searchable: true,
                title: Text('Select Categories'),
                onTap: (value) {
                  print(value);
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
            SizedBox(height: 16),
            ButtonBar(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      context.popRoute();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
