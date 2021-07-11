import 'package:dashboard/pages/catalog/products/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/models.dart';

final productsProvider =
    StateNotifierProvider<ProductPaginationController, ProductPagination>(
        (ref) {
  final _productRepository = ref.read(productRepository);
  return ProductPaginationController(_productRepository);
});

class ProductPaginationController extends StateNotifier<ProductPagination> {
  ProductPaginationController(this._productRepository)
      : super(ProductPagination.initial()) {
    getProducts();
  }

  final ProductRepository _productRepository;

  Future<void> getProducts() async {
    try {
      final products = await _productRepository.getProducts(state.page);
      state = state.copyWith(
          products: [...state.products, ...products],
          page: state.page + 1 * 10);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void handleScrollWithIndex(int index) async {
    print('handlScrollIndex: $index');
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 10 == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ 10;
    print(
        'itemPosition: $itemPosition, requestMoreData: $requestMoreData, pageToRequest: $pageToRequest ');

    if (requestMoreData && pageToRequest + 1 >= state.page) {
      print('getting products');
      getProducts();
    }
  }
}
