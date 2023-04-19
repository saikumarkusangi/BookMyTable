// To parse this JSON data, do
//
//     final topPicksModel = topPicksModelFromJson(jsonString);

import 'dart:convert';

List<TopPicksModel> topPicksModelFromJson(String str) => List<TopPicksModel>.from(json.decode(str).map((x) => TopPicksModel.fromJson(x)));

String topPicksModelToJson(List<TopPicksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopPicksModel {
    TopPicksModel({
        required this.id,
        required this.name,
        required this.description,
        required this.collection,
        required this.phoneNumber,
        required this.image,
        required this.menu,
        required this.rating,
        required this.logo,
    });

    int id;
    String name;
    String description;
    String collection;
    String phoneNumber;
    String image;
    String menu;
    double rating;
    String logo;

    factory TopPicksModel.fromJson(Map<String, dynamic> json) => TopPicksModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        collection: json["collection"],
        phoneNumber: json["phone_number"],
        image: json["image"],
        menu: json["menu"],
        rating: json["rating"]?.toDouble(),
        logo: json["logo"],
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
        "logo": logo,
    };
}
