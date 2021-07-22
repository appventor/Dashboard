import '../../../../export.dart';
import '../model/models.dart';
import '../repository/product_repository.dart';

final productsProvider =
    StateNotifierProvider<ProductsController, Products>((ref) {
  final _productRepository = ref.read(productRepository);
  return ProductsController(_productRepository);
});

class ProductsController extends StateNotifier<Products> {
  ProductsController(this._productRepository) : super(Products(products: [])) {
    getProducts();
  }

  final ProductRepository _productRepository;

  Future<void> getProducts() async {
    try {
      final productsData = await _productRepository.getProducts(
          lastDocument: state.lastDocument);
      List<Product> products = productsData.docs
          .map((product) => Product.fromMap(product.data()))
          .toList();
      state = state.copyWith(products: [...state.products, ...products]);
    } catch (e) {
      debugPrint(e.toString());
      // state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> refresh() async {
    try {
      final productsData =
          await _productRepository.getProducts(lastDocument: null);
      List<Product> products = productsData.docs
          .map((product) => Product.fromMap(product.data()))
          .toList();
      state = state.copyWith(products: products);
    } catch (e) {
      debugPrint(e.toString());
      // state = state.copyWith(errorMessage: e.toString());
    }
  }

  void handleScrollWithIndex(int index) async {
    // final itemPosition = index + 1;
    // final requestMoreData = itemPosition % 10 == 0 && itemPosition != 0;
    // final pageToRequest = itemPosition ~/ 10;

    // if (requestMoreData && pageToRequest + 1 >= state.lastProduct) {
    //   print('getting products');
    //   getProducts();
    // }
  }
}
