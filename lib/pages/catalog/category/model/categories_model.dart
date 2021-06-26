// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

class Categories {
  Categories({
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

  Categories copyWith({
    String? id,
    String? title,
    String? desc,
    String? image,
    bool? featured,
    List<String>? tags,
    List<String>? subcategories,
    List<String>? products,
  }) =>
      Categories(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        image: image ?? this.image,
        featured: featured ?? this.featured,
        tags: tags ?? this.tags,
        subcategories: subcategories ?? this.subcategories,
        products: products ?? this.products,
      );

  factory Categories.fromJson(String str) =>
      Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        id: json["id"],
        title: json["title"] ?? '',
        desc: json["desc"] ?? '',
        image: json["image"] ?? 'http://picsum.photos',
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
