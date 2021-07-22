import '../../../../export.dart';
import '../repository/category_repository.dart';

final deleteCategory = FutureProvider.family<dynamic, String>((ref, id) async {
  return ref
      .read(categoryRepository)
      .deleteCategory(id: id)
      .then((value) async {
    return await ref
        .read(firebaseStorageProvider)
        .ref('categories/$id.jpg')
        .delete();
  });
});
