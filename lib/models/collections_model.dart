// To parse this JSON data, do
//
//     final collectionsModel = collectionsModelFromJson(jsonString);

import 'dart:convert';

List<CollectionsModel> collectionsModelFromJson(String str) => List<CollectionsModel>.from(json.decode(str).map((x) => CollectionsModel.fromJson(x)));

String collectionsModelToJson(List<CollectionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollectionsModel {
    CollectionsModel({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
    });

    int id;
    String name;
    String description;
    String image;

    factory CollectionsModel.fromJson(Map<String, dynamic> json) => CollectionsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
    };
}
