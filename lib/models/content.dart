import 'dart:convert';

class Content {
  String description;
  bool isCompleted;

  Content({
    required this.description,
    required this.isCompleted,
  });

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "isCompleted": isCompleted,
      };
}
