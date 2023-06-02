import 'dart:convert';
import 'package:notes_app/models/models.dart';

class Task {
  String? id;
  Content content;
  int contentCount;
  String date;
  String title;

  Task({
    required this.content,
    required this.contentCount,
    required this.date,
    required this.title,
    this.id,
  });

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        content: Content.fromJson(json["content"]),
        contentCount: json["contentCount"],
        date: json["date"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "content": content.toJson(),
        "contentCount": contentCount,
        "date": date,
        "title": title,
      };
}
