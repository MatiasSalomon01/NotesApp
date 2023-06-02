import 'dart:convert';
import 'package:notes_app/models/models.dart';

class Task {
  String? id;
  List<Content> content;
  int contentCount;
  String date;
  String title;

  Task({
    this.id,
    required this.content,
    required this.contentCount,
    required this.date,
    required this.title,
  });

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        contentCount: json["contentCount"],
        date: json["date"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "contentCount": contentCount,
        "date": date,
        "title": title,
      };
}
