import 'dart:io';

import '../../../../pages.dart';
import '../model/models.dart';
import '../repository/category_repository.dart';

final categoryProvider =
    StateProvider.autoDispose<Category>((ref) => Category.fromMap({}));

final saveCategory =
    StateNotifierProvider.autoDispose<SaveCategory, Category>((ref) {
  CategoryRepository _categoryRepository = ref.read(categoryRepository);
  FirebaseStorage storage = ref.read(firebaseStorageProvider);
  Category category = ref.watch(categoryProvider).state;
  if (category.id.isEmpty) {
    category = category.copyWith(id: ref.read(firestoreIdProvider));
  }
  return SaveCategory(
    storage: storage,
    categoryRepository: _categoryRepository,
    category: category,
  );
});

class SaveCategory extends StateNotifier<Category> {
  SaveCategory({
    required this.categoryRepository,
    required this.storage,
    required this.category,
  }) : super(category);

  final Category category;
  final CategoryRepository categoryRepository;
  final FirebaseStorage storage;

  validate() {}

  Future<String?> uploadImage() async {
    try {
      TaskSnapshot task = await storage
          .ref('categories/${state.id}.jpg')
          .putFile(File(state.imagePath!));
      return task.ref.getDownloadURL();
    } catch (error) {
      return null;
    }
  }

  Future<bool> save() async {
    return uploadImage().then((imageUrl) async {
      if (imageUrl != null) {
        state = state.copyWith(image: imageUrl);
        print(state.toMap());
        await categoryRepository.saveCategory(
            id: state.id, data: state.toMap());
        return true;
      } else
        return false;
    });
  }
}
