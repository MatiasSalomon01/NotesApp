import 'dart:convert';

class Notes {
  String? id;
  String title;
  String content;
  String date;
  int color;

  Notes({
    this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });

  factory Notes.fromRawJson(String str) => Notes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        title: json["title"],
        content: json["content"],
        date: json["date"],
        color: int.parse(json["color"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "date": date,
        "color": color.toString(),
      };
}
