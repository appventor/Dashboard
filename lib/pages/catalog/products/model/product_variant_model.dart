import 'dart:convert';

class Variant {
  Variant({
    required this.id,
    required this.images,
    required this.price,
    required this.stock,
    required this.unit,
    required this.value,
  });

  final String id;
  final List<String> images;
  final double price;
  final int stock;
  final String unit;
  final String value;

  Variant copyWith({
    String? id,
    List<String>? images,
    double? price,
    int? stock,
    String? unit,
    String? value,
  }) =>
      Variant(
        id: id ?? this.id,
        images: images ?? this.images,
        price: price ?? this.price,
        stock: stock ?? this.stock,
        unit: unit ?? this.unit,
        value: value ?? this.value,
      );

  factory Variant.fromJson(String str) => Variant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Variant.fromMap(Map<String, dynamic> json) => Variant(
        id: json["id"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : [],
        price: json["price"] ?? 0.0,
        stock: json["stock"] ?? 0,
        unit: json["unit"] ?? '',
        value: json["value"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "stock": stock,
        "unit": unit,
        "value": value,
      };
}
