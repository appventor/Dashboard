import 'dart:io';

import 'package:dashboard/export.dart';
import 'package:dashboard/pages/catalog/products/repository/product_repository.dart';
import '../model/models.dart';

final productProvider = StateProvider<Product>((ref) => Product.fromMap({}));

final saveProduct = StateNotifierProvider<SaveProduct, Product>((ref) {
  ProductRepository _productRepository = ref.read(productRepository);
  FirebaseStorage storage = ref.read(firebaseStorageProvider);
  Product product = ref.watch(productProvider).state;
  if (product.id.isEmpty) {
    product = product.copyWith(id: ref.read(firestoreIdProvider));
  }
  return SaveProduct(
    product: product,
    productRepository: _productRepository,
    storage: storage,
  );
});

class SaveProduct extends StateNotifier<Product> {
  SaveProduct({
    required this.product,
    required this.productRepository,
    required this.storage,
  }) : super(product);

  final Product product;
  final ProductRepository productRepository;
  final FirebaseStorage storage;

  bool validate() {
    try {
      assert(state.id.isNotEmpty);
      assert(state.title.isNotEmpty);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<String?> uploadImage() async {
    try {
      TaskSnapshot task = await storage
          .ref('products/${state.id}.jpg')
          .putFile(File(state.imagePath!));
      return task.ref.getDownloadURL();
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  Future<bool> save() async {
    if (validate()) {
      if (state.imagePath != null) {
        return uploadImage().then((imageUrl) async {
          if (imageUrl != null) {
            state = state.copyWith(image: imageUrl);
            await productRepository.saveProduct(
                id: state.id, data: state.toMap());
            return true;
          } else {
            return false;
          }
        });
      } else {
        await productRepository.saveProduct(id: state.id, data: state.toMap());
        return true;
      }
    } else {
      return false;
    }
  }
}
