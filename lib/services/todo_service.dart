import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/models.dart';

class TodoService extends ChangeNotifier {
  List<Task> tasks = [];
  bool isLoading = false;

  TodoService() {
    getAll();
  }

  getAll() async {
    isLoading = true;
    tasks.clear();
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.get(url);

    if (response.body != 'null') {
      final Map<String, dynamic> map = json.decode(response.body);
      map.forEach((key, value) {
        final model = Task.fromJson(value);
        model.id = key;
        tasks.add(model);
      });
      notifyListeners();
    }
    isLoading = false;
  }

  getById() {}

  create(Task task) async {
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.post(url, body: task.toRawJson());
    final Map<String, dynamic> map = json.decode(response.body);
    return map.values.first.toString();
  }

  updateOnlyDescription(String id, int index, String description) async {
    final url = Uri.https(
        Constants.baseUrl, 'Todo/$id/content/$index/description.json');
    await http.put(url, body: json.encode(description));
  }

  updateOnlyIsCompleted(String id, int index, bool isCompleted) async {
    final url = Uri.https(
        Constants.baseUrl, 'Todo/$id/content/$index/isCompleted.json');
    await http.put(url, body: json.encode(isCompleted));
  }

  delete(String id) async {
    final url = Uri.https(Constants.baseUrl, 'Todo/$id.json');
    await http.delete(url);
  }
}
