import '../../../../export.dart';
import '../model/models.dart';
import '../repository/category_repository.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  CategoryRepository _categoryRepository = ref.read(categoryRepository);
  List<Map<String, dynamic>> data = await _categoryRepository.fetchCategories();
  List<Category> categories =
      List<Category>.from(data.map((x) => Category.fromMap(x)));
  return categories;
});
