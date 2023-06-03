import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/models.dart';

class TodoService extends ChangeNotifier {
  List<Task> tasks = [];
  TodoService() {
    getAll();
  }
  getAll() async {
    tasks.clear();
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);

    map.forEach((key, value) {
      final model = Task.fromJson(value);
      model.id = key;
      tasks.add(model);
    });

    notifyListeners();
  }

  getById() {}

  create(Task task) async {
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.post(url, body: task.toRawJson());
    final Map<String, dynamic> map = json.decode(response.body);
    // return map.values.first.toString();
  }

  update() {}

  delete() {}
}
