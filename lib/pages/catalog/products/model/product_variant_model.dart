import 'dart:convert';

import 'models.dart';

class Variant {
  Variant({
    required this.id,
    required this.unit,
    required this.value,
    required this.price,
    required this.images,
    this.imagePaths = const [],
    required this.inventory,
    this.selected = false,
  });

  String id;
  String unit;
  String value;
  double price;
  List<String> images;
  List<ImageModel> imagePaths;
  List<Inventory> inventory;
  bool selected;

  Variant copyWith({
    String? id,
    String? unit,
    String? value,
    double? price,
    List<String>? images,
    List<ImageModel>? imagePaths,
    List<Inventory>? inventory,
  }) =>
      Variant(
        id: id ?? this.id,
        unit: unit ?? this.unit,
        value: value ?? this.value,
        price: price ?? this.price,
        images: images ?? this.images,
        imagePaths: imagePaths ?? this.imagePaths,
        inventory: inventory ?? this.inventory,
      );

  bool operator ==(o) => o is Variant && o.id == id;

  int get hashCode => id.hashCode;

  factory Variant.fromJson(String str) => Variant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Variant.fromMap(Map<String, dynamic> json) => Variant(
        id: json["id"] ?? '',
        unit: json["unit"] ?? '',
        value: json["value"] ?? '',
        price: json["price"] ?? 0.0,
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : [],
        inventory: json["inventory"] != null
            ? List<Inventory>.from(
                json["inventory"].map((x) => Inventory.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "unit": unit,
        "value": value,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
        "inventory": List<dynamic>.from(inventory.map((x) => x.toMap())),
      };
}

class Inventory {
  Inventory({
    required this.id,
    required this.stock,
  });

  final String id;
  int stock;

  Inventory copyWith({
    String? id,
    int? stock,
  }) =>
      Inventory(
        id: id ?? this.id,
        stock: stock ?? this.stock,
      );

  bool operator ==(o) => o is Inventory && o.id == id;

  int get hashCode => id.hashCode;

  factory Inventory.fromJson(String str) => Inventory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Inventory.fromMap(Map<String, dynamic> json) => Inventory(
        id: json["id"] ?? '',
        stock: json["stock"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "stock": stock,
      };
}
