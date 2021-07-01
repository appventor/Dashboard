import '../../../../pages.dart';
import '../repository/category_repository.dart';

final deleteCategory = FutureProvider.family<dynamic, String>((ref, id) async =>
    await ref.read(categoryRepository).deleteCategory(id: id));
