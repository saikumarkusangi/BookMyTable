// To parse this JSON data, do
//
//     final restaurants = restaurantsFromJson(jsonString);

import 'dart:convert';

Restaurants restaurantsFromJson(String str) => Restaurants.fromJson(json.decode(str));

String restaurantsToJson(Restaurants data) => json.encode(data.toJson());

class Restaurants {
    Restaurants({
        required this.data,
    });

    List<Datum> data;

    factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.description,
        required this.collection,
        required this.phoneNumber,
        required this.image,
        required this.menu,
        required this.rating,
    });

    int id;
    String name;
    String description;
    String collection;
    String phoneNumber;
    String image;
    String menu;
    double rating;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        collection: json["collection"],
        phoneNumber: json["phone_number"],
        image: json["image"],
        menu: json["menu"],
        rating: json["rating"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "collection": collection,
        "phone_number": phoneNumber,
        "image": image,
        "menu": menu,
        "rating": rating,
    };
}
