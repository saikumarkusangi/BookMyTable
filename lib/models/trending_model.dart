// To parse this JSON data, do
//
//     final trendingModel = trendingModelFromJson(jsonString);

import 'dart:convert';

List<TrendingModel> trendingModelFromJson(String str) => List<TrendingModel>.from(json.decode(str).map((x) => TrendingModel.fromJson(x)));

String trendingModelToJson(List<TrendingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingModel {
    TrendingModel({
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

    factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
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
