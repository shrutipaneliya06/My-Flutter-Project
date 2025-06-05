// To parse this JSON data, do
//
//     final notes = notesFromJson(jsonString);

import 'dart:convert';

List<Notes> notesFromJson(String str) =>
    List<Notes>.from(json.decode(str).map((x) => Notes.fromJson(x)));

String notesToJson(List<Notes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notes {
  Notes({
    required this.id,
    required this.title,
    required this.description,
  });

  String id;
  String title;
  String description;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
      };
}
