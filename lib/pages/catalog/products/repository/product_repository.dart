import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/models.dart';

final productRepository =
    Provider<ProductRepository>((ref) => ProductRepository());

class ProductRepository {
  Future<List<Product>> getProducts([int page = 1]) async {
    try {
      final response = await Future.delayed(Duration(seconds: 3), () => {});

      final results = List<Map<String, dynamic>>.from(response['results']);

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
