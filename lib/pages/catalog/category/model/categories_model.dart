// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.featured,
    required this.tags,
    required this.subcategories,
    required this.products,
  });

  final String id;
  final String title;
  final String desc;
  final String image;
  final bool featured;
  final List<String> tags;
  final List<String> subcategories;
  final List<String> products;

  Category copyWith({
    String? id,
    String? title,
    String? desc,
    String? image,
    bool? featured,
    List<String>? tags,
    List<String>? subcategories,
    List<String>? products,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        image: image ?? this.image,
        featured: featured ?? this.featured,
        tags: tags ?? this.tags,
        subcategories: subcategories ?? this.subcategories,
        products: products ?? this.products,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"] ?? '',
        desc: json["desc"] ?? '',
        image: json["image"] ?? 'https://picsum.photos/100',
        featured: json["featured"] ?? false,
        tags: json["tags"] != null
            ? List<String>.from(json["tags"].map((x) => x))
            : [],
        subcategories: json["subcategories"] != null
            ? List<String>.from(json["subcategories"].map((x) => x))
            : [],
        products: json["products"] != null
            ? List<String>.from(json["products"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "desc": desc,
        "image": image,
        "featured": featured,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "subcategories": List<dynamic>.from(subcategories.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}
