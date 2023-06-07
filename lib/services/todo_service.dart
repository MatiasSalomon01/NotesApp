import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/models.dart';

class TodoService extends ChangeNotifier {
  List<Task> tasks = [];
  bool isLoading = false;

  Map<int, String> indexMap = {};

  List<dynamic> data = [];

  TodoService() {
    getAll();
  }

  getAll() async {
    isLoading = true;
    int count = 0;
    tasks.clear();
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.get(url);

    if (response.body != 'null') {
      final Map<String, dynamic> map = json.decode(response.body);
      map.forEach((key, value) {
        final model = Task.fromJson(value);
        model.id = key;
        tasks.add(model);

        var countId = {count: key};
        data.add(countId);

        count++;
      });
    }

    isLoading = false;

    data.forEach((element) {
      Map<int, String> x = element;
      indexMap.addAll(x);
    });

    notifyListeners();
  }

  getById() {}

  create(Task task) async {
    final url = Uri.https(Constants.baseUrl, 'Todo.json');
    final response = await http.post(url, body: task.toRawJson());
    final Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 200) {
      task.id = map["name"];
      tasks.add(task);
    }
    notifyListeners();
  }

  updateOnlyDescription(String id, int index, String description) async {
    final url = Uri.https(
        Constants.baseUrl, 'Todo/$id/content/$index/description.json');
    await http.put(url, body: json.encode(description));
  }

  updateOnlyIsCompleted(Task task, int index, bool isCompleted) async {
    final url = Uri.https(
        Constants.baseUrl, 'Todo/${task.id}/content/$index/isCompleted.json');
    final response = await http.put(url, body: json.encode(isCompleted));
    if (response.statusCode == 200) {
      tasks = tasks.map((e) {
        if (e.id != task.id) return e;
        e.content[index].isCompleted = isCompleted;
        return e;
      }).toList();
    }
    notifyListeners();
  }

  updateContentData(Task task) async {
    final url = Uri.https(Constants.baseUrl, '/Todo/${task.id}/.json');
    final response = await http.put(url, body: task.toRawJson());

    if (response.statusCode == 200) {
      tasks = tasks.map((e) {
        if (e.id != task.id) return e;
        e.content = task.content;
        e.contentCount = task.contentCount;
        return e;
      }).toList();
    }
    notifyListeners();
  }

  delete(String id) async {
    final url = Uri.https(Constants.baseUrl, 'Todo/$id.json');
    await http.delete(url);

    tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  deleteByContentIndex(Task task, int index) async {
    final url = Uri.https(Constants.baseUrl, 'Todo/${task.id}.json');
    late Response response;
    if (task.contentCount == 0) {
      delete(task.id!);
    } else {
      response = await http.put(url, body: task.toRawJson());
      if (response.statusCode == 200) {
        tasks = tasks.map((e) {
          if (e.id != task.id) return e;
          e = task;
          return e;
        }).toList();
      }
      notifyListeners();
    }
  }

  updateContentCount(String id, int count) async {
    final url = Uri.https(Constants.baseUrl, '/Todo/$id/contentCount.json');
    final response = await http.put(url, body: json.encode(count));
    // print(response.statusCode);
  }
}
