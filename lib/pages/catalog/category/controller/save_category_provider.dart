import 'dart:io';

import 'package:flutter/foundation.dart' as web;
import 'package:image_picker/image_picker.dart';

import '../../../../pages.dart';
import '../model/models.dart';
import '../repository/category_repository.dart';

final categoryProvider = StateProvider<Category>((ref) => Category.fromMap({}));

final saveCategory = StateNotifierProvider<SaveCategory, Category>((ref) {
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

  validate() {
    try {
      assert(state.id.isNotEmpty);
      assert(state.title.isNotEmpty);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> uploadImage() async {
    try {
      TaskSnapshot task;
      if (!web.kIsWeb)
        task = await storage
            .ref('categories/${state.id}.jpg')
            .putFile(File(state.imagePath!));
      else
        task = await storage.ref('categories/${state.id}.jpg').putData(
              await PickedFile(state.imagePath!).readAsBytes(),
              SettableMetadata(contentType: 'image/jpeg'),
            );
      return task.ref.getDownloadURL();
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> save() async {
    print(state.toMap());

    if (validate()) {
      if (state.imagePath != null)
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
      else {
        print(state.toMap());
        await categoryRepository.saveCategory(
            id: state.id, data: state.toMap());
        return true;
      }
    } else
      return false;
  }
}
