import '../../../../pages.dart';

final categoryRepository = Provider<CategoryRepository>((ref) {
  FirebaseFirestore _firestore = ref.read(firestoreProvider);
  return CategoryRepository(_firestore);
});

class CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository(this._firestore);

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    QuerySnapshot<Map<String, dynamic>> categories =
        await _firestore.collection("categories").get();
    return categories.docs.map((category) => category.data()).toList();
  }

  Future<void> saveCategory(
      {required String id, required Map<String, dynamic> data}) async {
    return await _firestore.collection("categories").doc(id).set(data);
  }

  Future<void> deleteCategory({required String id}) async {
    return await _firestore.collection("categories").doc(id).delete();
  }
}
