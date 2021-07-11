import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/services/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/models.dart';

final productRepository = Provider<ProductRepository>((ref) {
  FirebaseFirestore _firestore = ref.watch(firestoreProvider);
  return ProductRepository(_firestore);
});

class ProductRepository {
  ProductRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<List<Product>> getProducts([int page = 1]) async {
    try {
      QuerySnapshot<Map<String, dynamic>> documentList = await _firestore
          .collection("products")
          .orderBy("title")
          .limit(10)
          .get();
      final results = List<Map<String, dynamic>>.from(
          documentList.docs.map((doc) => doc.data()));
      List<Product> products = results
          .map((product) => Product.fromMap(product))
          .toList(growable: false);
      return products;
    } catch (error) {
      print("RESULT ERR $error");
      return [];
    }
  }

  saveProductInCategory() {}

  removeProductInCategory() {}

  saveProductInCollection() {}

  removeProductInCollection() {}

  Future<void> saveProduct(
      {required String id, required Map<String, dynamic> data}) async {
    return await _firestore.collection("products").doc(id).set(data);
  }

  Future<void> updateProduct(
      {required String id, required Map<String, dynamic> data}) async {
    return await _firestore.collection("products").doc(id).update(data);
  }

  Future<void> deleteProduct({required String id}) async {
    return await _firestore.collection("products").doc(id).delete();
  }

  Future<void> deleteVariant({required String id}) async {
    return await _firestore.collection("products").doc(id).update({});
  }
}
