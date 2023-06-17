// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

JsonModel newsModelFromJson(String str) => JsonModel.fromJson(json.decode(str));

String newsModelToJson(JsonModel data) => json.encode(data.toJson());

class JsonModel {
  int status;
  int page;
  int total;
  List<NewModel> data;

  JsonModel({
    required this.status,
    required this.page,
    required this.total,
    required this.data,
  });

  factory JsonModel.fromJson(Map<String, dynamic> json) => JsonModel(
        status: json["status"],
        page: json["page"],
        total: json["total"],
        data:
            List<NewModel>.from(json["data"].map((x) => NewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "page": page,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NewModel {
  String id;
  String title;
  String description;
  Image image;
  DateTime date;

  NewModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: Image.fromJson(json["image"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image.toJson(),
        "date": date.toIso8601String(),
      };
}

class Image {
  String url;
  String thumb;
  String medium;

  Image({
    required this.url,
    required this.thumb,
    required this.medium,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        thumb: json["thumb"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "thumb": thumb,
        "medium": medium,
      };
}
