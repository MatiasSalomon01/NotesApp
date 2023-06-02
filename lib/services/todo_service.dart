import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/models.dart';

class TodoService extends ChangeNotifier {
  Future<List<Task>> getAll() async {
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);

    List<Task> tasks = [];

    map.forEach((key, value) {
      final model = Task.fromJson(value);
      model.id = key;
      tasks.add(model);
    });

    return tasks;
  }

  getById() {}

  create() {}

  update() {}

  delete() {}
}
