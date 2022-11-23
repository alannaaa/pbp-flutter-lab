// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

List<Watchlist> watchlistFromJson(String str) => List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String watchlistToJson(List<Watchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Watchlist {
  Watchlist({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),  
  };
}

class Fields {
  Fields({
    required this.title,
    required this.watched,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  String title;
  bool watched;
  int rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    title: json["title"],
    watched: json["watched"],
    rating: json["rating"],
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "watched": watched,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}
