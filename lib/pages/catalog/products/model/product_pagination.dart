import 'package:flutter/foundation.dart';

import 'models.dart';

class ProductPagination {
  final List<Product> products;
  final int page;
  final String errorMessage;
  ProductPagination({
    required this.products,
    required this.page,
    required this.errorMessage,
  });

  ProductPagination.initial()
      : products = [],
        page = 1,
        errorMessage = '';

  bool get refreshError => errorMessage != '' && products.length <= 20;

  ProductPagination copyWith({
    List<Product>? products,
    int? page,
    String? errorMessage,
  }) {
    return ProductPagination(
      products: products ?? this.products,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'MoviePagination(movies: $products, page: $page, errorMessage: $errorMessage)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProductPagination &&
        listEquals(o.products, products) &&
        o.page == page &&
        o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => products.hashCode ^ page.hashCode ^ errorMessage.hashCode;
}
