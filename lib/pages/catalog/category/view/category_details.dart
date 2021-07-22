import 'package:dashboard/pages/catalog/category/model/categories_model.dart';

import '../../../../export.dart';
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
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButton(),
                    Text('Category Details',
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                Divider(),
                GeneralInformation(),
                Divider(),
                LinkCategories(
                  excludeID: context.read(categoryProvider).state.id,
                  initialValue:
                      context.read(categoryProvider).state.subcategories,
                  onSelected: (var value) {
                    print(value);
                    context.read(categoryProvider).state = context
                        .read(categoryProvider)
                        .state
                        .copyWith(
                            subcategories: value
                                .map((items) => items.toString())
                                .toList());
                  },
                ),
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
                          setState(() {
                            _loading = true;
                          });
                          context
                              .read(saveCategory.notifier)
                              .save()
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
                            setState(() {
                              _loading = false;
                            });
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
        ),
        Visibility(
            visible: _loading,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black54,
              child: Center(child: CircularProgressIndicator()),
            )),
      ],
    );
  }
}
