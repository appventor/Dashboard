import 'package:dashboard/pages/catalog/category/controller/categories_provider.dart';

import '../../../../pages.dart';
import 'widgets/general_information.dart';
import '../controller/save_category_provider.dart';
import '../../widgets/link_categories.dart';

class CategoryDetails extends StatefulWidget {
  final String id;
  const CategoryDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Category',
                style: Theme.of(context).textTheme.headline6),
            Divider(),
            GeneralInformation(),
            Divider(),
            LinkCategories(),
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
                    onPressed: () async {
                      final overlay = LoadingOverlay.of(context);
                      overlay
                          .during(context
                              .read(saveCategory(widget.id).notifier)
                              .save())
                          .whenComplete(() {
                        context.read(categoryTitle).state = '';
                        context.read(categoryDesc).state = '';
                        context.read(categoryImagePath).state = '';
                        context.read(categorySubcategories).state = [];
                        context.refresh(categoriesProvider);
                        context.popRoute();
                      });
                    },
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
