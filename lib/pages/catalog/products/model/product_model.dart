// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class Product {
  Product({
    required this.id,
    required this.catId,
    required this.subCatId,
    required this.title,
    required this.desc,
    required this.image,
    required this.featured,
    required this.stock,
    required this.pricetag,
    required this.brandId,
    required this.brand,
    required this.tags,
    required this.offer,
    required this.variants,
  });

  final String id;
  final String catId;
  final String subCatId;
  final String title;
  final String desc;
  final String image;
  final bool featured;
  final int stock;
  final String pricetag;
  final String brandId;
  final String brand;
  final List<String> tags;
  final ProductOffer offer;
  final List<Variant> variants;

  bool selected = false;

  Product copyWith({
    String? id,
    String? catId,
    String? subCatId,
    String? title,
    String? desc,
    String? image,
    bool? featured,
    int? stock,
    String? pricetag,
    String? brandId,
    String? brand,
    List<String>? tags,
    ProductOffer? offer,
    List<Variant>? variants,
  }) =>
      Product(
        id: id ?? this.id,
        catId: catId ?? this.catId,
        subCatId: subCatId ?? this.subCatId,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        image: image ?? this.image,
        featured: featured ?? this.featured,
        stock: stock ?? this.stock,
        pricetag: pricetag ?? this.pricetag,
        brandId: brandId ?? this.brandId,
        brand: brand ?? this.brand,
        tags: tags ?? this.tags,
        offer: offer ?? this.offer,
        variants: variants ?? this.variants,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        catId: json["catId"] ?? '',
        subCatId: json["subCatId"] ?? '',
        title: json["title"] ?? '',
        desc: json["desc"] ?? '',
        image: json["image"] ?? "https://picsum.photos/100",
        featured: json["featured"] ?? false,
        stock: json["stock"] ?? 0,
        pricetag: json["pricetag"] ?? '',
        brandId: json["brandId"] ?? '',
        brand: json["brand"] ?? '',
        tags: json["tags"] != null
            ? List<String>.from(json["tags"].map((x) => x))
            : [],
        offer: json["offer"] != null
            ? ProductOffer.fromMap(json["offer"])
            : ProductOffer.fromMap({}),
        variants: json["variants"] != null
            ? List<Variant>.from(
                json["variants"].map((x) => Variant.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "catId": catId,
        "subCatId": subCatId,
        "title": title,
        "desc": desc,
        "image": image,
        "featured": featured,
        "stock": stock,
        "pricetag": pricetag,
        "brandId": brandId,
        "brand": brand,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "offer": offer.toMap(),
        "variants": List<dynamic>.from(variants.map((x) => x.toMap())),
      };
}

///JSON PRODUCT SCHEMA
Map<String, Object> productJsonSchema = {
  "id": "ABCDEFGHIJKLMNOP",
  "catId": "ABCDEFG123456789",
  "subCatId": "123456789KLMNOP",
  "title": "Cucumber",
  "desc": "Green Vegetable",
  "image": "https://picsum.photos/101",
  "featured": true,
  "pricetag": "12.00/Kg",
  "stock": 200,
  "brandId": "BVGCFDHBJKHK",
  "brand": "Veggies",
  "tags": ["Veg"],
  "offer": {"id": "ASDFGHJKLMNBVC", "type": "perc/price", "value": 23.32},
  "variants": [
    {
      "id": "KKSKSKSASKSAS<",
      "images": [
        "https://picsum.photos/100",
        "https://picsum.photos/101",
        "https://picsum.photos/101",
        "https://picsum.photos/101",
      ],
      "price": 12.00,
      "stock": 12,
      "unit": "kg",
      "value": "1"
    }
  ]
};
