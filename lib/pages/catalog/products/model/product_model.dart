// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.desc,
    this.image,
    this.imagePath,
    required this.featured,
    required this.pricetag,
    required this.tax,
    required this.categories,
    required this.collection,
    required this.tags,
    required this.offer,
    required this.variants,
  });

  String id;
  String title;
  String desc;
  String? image;
  String? imagePath;
  bool featured;
  String pricetag;
  double tax;
  List<String> categories;
  List<String> collection;
  List<String> tags;
  ProductOffer offer;
  List<Variant> variants;
  bool selected = false;

  Product copyWith({
    String? id,
    String? title,
    String? desc,
    String? image,
    String? imagePath,
    bool? featured,
    int? stock,
    String? pricetag,
    double? tax,
    List<String>? categories,
    List<String>? collection,
    List<String>? tags,
    ProductOffer? offer,
    List<Variant>? variants,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        image: image ?? this.image,
        imagePath: imagePath ?? this.imagePath,
        featured: featured ?? this.featured,
        pricetag: pricetag ?? this.pricetag,
        tax: tax ?? this.tax,
        categories: categories ?? this.categories,
        collection: collection ?? this.collection,
        tags: tags ?? this.tags,
        offer: offer ?? this.offer,
        variants: variants ?? this.variants,
      );

  @override
  bool operator ==(other) => other is Product && other.id == id;

  @override
  int get hashCode => id.hashCode;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        desc: json['desc'] ?? '',
        image: json['image'],
        featured: json['featured'] ?? false,
        pricetag: json['pricetag'] ?? '',
        tax: json['tax'] != null ? json['tax'].toDouble() : 0.0,
        categories: json['categories'] != null
            ? List<String>.from(json['categories'].map((x) => x))
            : [],
        collection: json['collection'] != null
            ? List<String>.from(json['collection'].map((x) => x))
            : [],
        tags: json['tags'] != null
            ? List<String>.from(json['tags'].map((x) => x))
            : [],
        offer: json['offer'] != null
            ? ProductOffer.fromMap(json['offer'])
            : ProductOffer.fromMap({}),
        variants: json['variants'] != null
            ? List<Variant>.from(
                json['variants'].map((x) => Variant.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'desc': desc,
        'image': image,
        'featured': featured,
        'pricetag': pricetag,
        'tax': tax,
        'categories': List<dynamic>.from(categories.map((x) => x)),
        'collection': List<dynamic>.from(collection.map((x) => x)),
        'tags': List<dynamic>.from(tags.map((x) => x)),
        'offer': offer.toMap(),
        'variants': List<dynamic>.from(variants.map((x) => x.toMap())),
      };
}

///JSON PRODUCT SCHEMA
Map<String, Object> productJsonSchema = {
  'id': 'ABCDEFGHIJKLMNOP',
  'title': 'Cucumber',
  'desc': 'Green Vegetable',
  'image': 'https://picsum.photos/400',
  'featured': true,
  'pricetag': '12.00/Kg',
  'categories': ['ABCDEFG123456789'],
  'collections': ['khsdgjahsgdf'],
  'tags': ['Veg'],
  'offer': {'id': 'ASDFGHJKLMNBVC', 'type': 'perc/price', 'value': 23.32},
  'variants': [
    {
      'id': "KKSKSKSASKSAS'",
      'unit': 'kg',
      'value': '1',
      'price': 12.00,
      'images': [
        'https://picsum.photos/100',
        'https://picsum.photos/102',
        'https://picsum.photos/101',
      ],
      'inventory': [
        {'id': 'adfwedffdfdwfewfwdfc', 'stock': 12},
        {'id': 'dsfdsfdsfdsfsvvdfdsf', 'stock': 20},
        {'id': 'werwervcxzcvsdsdfwfv', 'stock': 40}
      ]
    },
    {
      'id': "wefewweewfwe'",
      'unit': 'gm',
      'value': '500',
      'price': 12.00,
      'images': [
        'https://picsum.photos/109',
        'https://picsum.photos/110',
        'https://picsum.photos/111',
        'https://picsum.photos/112',
      ],
      'inventory': [
        {'id': 'adfwedffdfdwfewfwdfc', 'stock': 40},
        {'id': 'dsfdsfdsfdsfsvvdfdsf', 'stock': 20},
        {'id': 'werwervcxzcvsdsdfwfv', 'stock': 79}
      ]
    },
    {
      'id': "KKSKSKSASKSAS'",
      'unit': 'kg',
      'value': '1',
      'price': 12.00,
      'images': [
        'https://picsum.photos/108',
        'https://picsum.photos/107',
        'https://picsum.photos/106',
        'https://picsum.photos/105',
      ],
      'inventory': [
        {'id': 'adfwedffdfdwfewfwdfc', 'stock': 60},
        {'id': 'dsfdsfdsfdsfsvvdfdsf', 'stock': 20},
        {'id': 'werwervcxzcvsdsdfwfv', 'stock': 12}
      ]
    }
  ]
};
