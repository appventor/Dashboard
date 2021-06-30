import '../../../../pages.dart';
import '../model/models.dart';
import '../repository/category_repository.dart';

final categoryProvider = StateProvider<Category>((ref) => Category.fromMap({}));

final saveCategory =
    FutureProvider.autoDispose.family<bool, Category>((ref, category) async {
  CategoryRepository _categoryRepository = ref.read(categoryRepository);
  await _categoryRepository.saveCategory(id: '', data: category.toMap());
  return true;
});
