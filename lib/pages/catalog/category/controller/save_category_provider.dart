import 'dart:io';

import '../../../../pages.dart';
import '../model/models.dart';
import '../repository/category_repository.dart';

final categoryTitle = StateProvider<String>((ref) => '');
final categoryDesc = StateProvider<String>((ref) => '');
final categoryImagePath = StateProvider<String>((ref) => '');
final categorySubcategories = StateProvider<List<String>>((ref) => []);
final categoryProducts = StateProvider<List<String>>((ref) => []);

final saveCategory = StateNotifierProvider.family
    .autoDispose<SaveCategory, Category, String>((ref, id) {
  CategoryRepository _categoryRepository = ref.read(categoryRepository);
  FirebaseStorage storage = ref.read(firebaseStorageProvider);
  String title = ref.watch(categoryTitle).state;
  String desc = ref.watch(categoryDesc).state;
  String imagepath = ref.watch(categoryImagePath).state;
  List<String> subcategories = ref.watch(categorySubcategories).state;
  print(title + " , " + desc);

  return SaveCategory(
    id: id,
    title: title,
    desc: desc,
    imagePath: imagepath,
    subcategories: subcategories,
    storage: storage,
    categoryRepository: _categoryRepository,
  );
});

class SaveCategory extends StateNotifier<Category> {
  SaveCategory({
    required this.categoryRepository,
    required this.storage,
    required this.id,
    required this.title,
    required this.desc,
    required this.imagePath,
    required this.subcategories,
  }) : super(Category.fromMap({
          "id": id,
          "title": title,
          "desc": desc,
          "subcategories": subcategories,
        }));

  final String id, title, desc, imagePath;
  final List<String> subcategories;
  final CategoryRepository categoryRepository;
  final FirebaseStorage storage;

  uploadImage() {
    UploadTask task = storage
        .ref('categories/${imagePath.split('/').last}')
        .putFile(File(imagePath));
    return task.asStream();
  }

  Future<bool> save() async {
    // uploadImage();
    print(state.toMap());
    await categoryRepository.saveCategory(id: state.id, data: state.toMap());
    return true;
  }
}
