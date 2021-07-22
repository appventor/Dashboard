import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/services/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepository = Provider<ProductRepository>((ref) {
  FirebaseFirestore _firestore = ref.watch(firestoreProvider);
  return ProductRepository(_firestore);
});

class ProductRepository {
  ProductRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts(
      {required DocumentSnapshot? lastDocument}) async {
    QuerySnapshot<Map<String, dynamic>> documentList;
    Query<Map<String, dynamic>> query =
        _firestore.collection('products').orderBy('title').limit(10);
    if (lastDocument != null) {
      documentList = await query.startAfterDocument(lastDocument).get();
    } else {
      documentList = await query.get();
    }
    return documentList;
  }

  // saveProductInCategory() {}

  // removeProductInCategory() {}

  // saveProductInCollection() {}

  // removeProductInCollection() {}

  Future<void> saveProduct(
      {required String id, required Map<String, dynamic> data}) async {
    return await _firestore.collection('products').doc(id).set(data);
  }

  Future<void> updateProduct(
      {required String id, required Map<String, dynamic> data}) async {
    return await _firestore.collection('products').doc(id).update(data);
  }

  Future<void> deleteProduct({required String id}) async {
    return await _firestore.collection('products').doc(id).delete();
  }

  Future<void> deleteVariant({required String id}) async {
    return await _firestore.collection('products').doc(id).update({});
  }
}
