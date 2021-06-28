import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/services/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/models.dart';

final productRepository = Provider<ProductRepository>((ref) {
  FirebaseFirestore _firestoreProvider = ref.watch(firestoreProvider);
  return ProductRepository(_firestoreProvider);
});

class ProductRepository {
  ProductRepository(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  Future<List<Product>> getProducts([int page = 1]) async {
    try {
      var documentList = await _firebaseFirestore
          .collection("products")
          .orderBy("title")
          .limit(10)
          .get();
      final results = List<Map<String, dynamic>>.from(documentList.docs);
      print(results);
      List<Product> products = results
          .map((product) => Product.fromMap(product))
          .toList(growable: false);
      return products;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
