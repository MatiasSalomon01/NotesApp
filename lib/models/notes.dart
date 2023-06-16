import 'dart:convert';

class Notes {
  String? id;
  String title;
  String content;

  Notes({
    this.id,
    required this.title,
    required this.content,
  });

  factory Notes.fromRawJson(String str) => Notes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        content: json["content"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "title": title,
      };
}
