import '../../../../export.dart';
import '../controller/categories_provider.dart';
import 'widgets/add_category.dart';
import 'widgets/categories_datatable.dart';

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
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: IconButton(
                  onPressed: () => context.refresh(categoriesProvider),
                  icon: Icon(Icons.refresh),
                ),
              ),
              ElevatedButton(
                  onPressed: () => addCategoryDialog(context),
                  child: Text("Add Category"))
            ],
          ),
          CategoriesDataTable()
        ],
      ),
    ));
  }
}
