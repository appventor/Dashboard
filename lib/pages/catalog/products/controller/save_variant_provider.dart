// import 'dart:io';
import 'package:dashboard/pages/catalog/products/controller/save_product_provider.dart';
import 'package:dashboard/pages/warehouse/controller/warehouses_provider.dart';
import 'package:dashboard/pages/warehouse/models/warehouse_model.dart';
// import 'package:flutter/foundation.dart' as web;
// import 'package:image_picker/image_picker.dart';
import '../../../../export.dart';
import '../model/models.dart';

final variantProvider = StateProvider<Variant>((ref) => Variant.fromMap({}));

final inventoryProvider = StateProvider<List<Inventory>>((ref) {
  List<Warehouse> warehouses = ref.read(warehousesProvider).data!.value;
  return List.from(
      warehouses.map((warehouse) => Inventory(id: warehouse.id, stock: 0)));
});

final saveVariant = StateNotifierProvider<SaveVariant, Variant>((ref) {
  FirebaseStorage storage = ref.read(firebaseStorageProvider);
  StateController<Product> product = ref.watch(productProvider);
  var variant = ref.watch(variantProvider).state;
  if (variant.id.isEmpty) {
    variant.id = ref.read(firestoreIdProvider);
  }

  return SaveVariant(
    variant: variant,
    product: product,
    storage: storage,
  );
});

class SaveVariant extends StateNotifier<Variant> {
  SaveVariant({
    required this.variant,
    required this.product,
    required this.storage,
  }) : super(variant);
  final Variant variant;
  final StateController<Product> product;
  final FirebaseStorage storage;

  Future uploadImages() async {
    // try {} catch (e) {}
    // state.imagePaths.forEach((imagePath) async {
    // TaskSnapshot task;
    // if (!web.kIsWeb)
    //   task = await storage
    //       .ref('products/${state.id}.jpg')
    //       .putFile(File(imagePath));
    // else
    //   task = await storage.ref('products/${state.id}.jpg').putData(
    //         await PickedFile(imagePath).readAsBytes(),
    //         SettableMetadata(contentType: 'image/jpeg'),
    //       );
    // String imageUrl = await task.ref.getDownloadURL();
    // state.images.add(imageUrl);
    // });
  }

  Future<bool> saveVariant() async {
    if (state.imagePaths.isNotEmpty) await uploadImages();
    List<Variant> variants = product.state.variants;
    if (variants.contains(state)) {
      int index = variants.indexOf(state);
      variants.replaceRange(index, index + 1, [state]);
    } else {
      variants.add(state);
    }
    product.state = product.state.copyWith(variants: variants);
    state = Variant.fromMap({});
    return true;
  }
}
