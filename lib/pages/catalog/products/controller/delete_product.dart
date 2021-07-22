import '../../../../export.dart';
import '../repository/product_repository.dart';

final deleteProduct = FutureProvider.family<dynamic, String>((ref, id) async {
  return ref.read(productRepository).deleteProduct(id: id).then((value) async {
    return await ref
        .read(firebaseStorageProvider)
        .ref("products/$id.jpg")
        .delete();
  });
});

final deleteVariant = FutureProvider.family<dynamic, String>((ref, id) async {
  return ref.read(productRepository).deleteVariant(id: id).then((value) async {
    return await ref
        .read(firebaseStorageProvider)
        .ref("products/$id.jpg")
        .delete();
  });
});
