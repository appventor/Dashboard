import 'package:dashboard/pages/catalog/category/model/categories_model.dart';

import '../../../../pages.dart';
import 'widgets/general_information.dart';
import '../controller/categories_provider.dart';
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
                      context.read(categoryProvider).state =
                          Category.fromMap({});
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
                          .during(context.read(saveCategory.notifier).save())
                          .then((result) {
                        if (result) {
                          context.read(categoryProvider).state =
                              Category.fromMap({});
                          context.refresh(categoriesProvider);
                          scaffoldMessengerKey.currentState!
                              .showSnackBar(SnackBar(
                            content: Text("Saved"),
                            backgroundColor: Colors.green,
                          ));
                          context.popRoute();
                        } else
                          scaffoldMessengerKey.currentState!
                              .showSnackBar(SnackBar(
                            content: Text("Error, Please try again"),
                            backgroundColor: Colors.red,
                          ));
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
