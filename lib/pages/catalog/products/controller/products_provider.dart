import 'package:dashboard/pages/catalog/products/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/models.dart';

final moviePaginationControllerProvider =
    StateNotifierProvider<ProductPaginationController, dynamic>((ref) {
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
          products: [...state.products, ...products], page: state.page + 1);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void handleScrollWithIndex(int index) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ 20;

    if (requestMoreData && pageToRequest + 1 >= state.page) {
      getProducts();
    }
  }
}
