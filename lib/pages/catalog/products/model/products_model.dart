import 'dart:convert';
import '../../../../export.dart';
import 'models.dart';

class Products {
  Products({
    required this.products,
    this.lastDocument,
  });

  List<Product> products;
  DocumentSnapshot? lastDocument;

  Products copyWith({
    List<Product>? products,
    DocumentSnapshot? lastDocument,
  }) =>
      Products(
        products: products ?? this.products,
        lastDocument: lastDocument ?? this.lastDocument,
      );

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        products: json['products'] == null
            ? []
            : List<Product>.from(
                json['products'].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'products': List<dynamic>.from(products.map((x) => x.toMap())),
      };
}
