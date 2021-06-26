import 'dart:convert';

class ProductOffer {
  ProductOffer({
    required this.id,
    required this.type,
    required this.value,
  });

  final String id;
  final String type;
  final double value;

  ProductOffer copyWith({
    String? id,
    String? type,
    double? value,
  }) =>
      ProductOffer(
        id: id ?? this.id,
        type: type ?? this.type,
        value: value ?? this.value,
      );

  factory ProductOffer.fromJson(String str) =>
      ProductOffer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductOffer.fromMap(Map<String, dynamic> json) => ProductOffer(
        id: json["id"],
        type: json["type"] ?? 'price',
        value: json["value"] ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "value": value,
      };
}
