import 'dart:convert';

class Warehouse {
  final String id;
  final String title;
  final Location location;

  Warehouse({required this.id, required this.title, required this.location});

  Warehouse copyWith({
    String? id,
    String? title,
    Location? location,
  }) =>
      Warehouse(
        id: id ?? this.id,
        title: title ?? this.title,
        location: location ?? this.location,
      );

  factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        location: json["location"] != null
            ? Location.fromMap(json["location"])
            : Location.fromMap({}),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "location": location.toMap(),
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  Location copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["lat"] ?? 0.0,
        longitude: json["long"] ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        "lat": latitude,
        "long": longitude,
      };
}

List<Map<String, Object>> warehouseData = [
  {
    "id": "adfwedffdfdwfewfwdfc",
    "title": "Kavoor",
    "location": {"lat": 123.123, "long": 123.23}
  },
  {
    "id": "dsfdsfdsfdsfsvvdfdsf",
    "title": "Attavar",
    "location": {"lat": 123.123, "long": 123.23}
  },
  {
    "id": "zxvcxzcvwdfwfcxvdvsv",
    "title": "Hampankatta",
    "location": {"lat": 123.123, "long": 123.23}
  },
  {
    "id": "werwervcxzcvsdsdfwfv",
    "title": "Kadri",
    "location": {"lat": 123.123, "long": 123.23}
  },
  {
    "id": "sdvdsfsdfvdsxzcvwdfv",
    "title": "Padil",
    "location": {"lat": 123.123, "long": 123.23}
  }
];
