import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/notes.dart';
import 'package:http/http.dart' as http;

class NotesService extends ChangeNotifier {
  List<Notes> notes = [];
  bool isLoading = false;

  NotesService() {
    getAll();
  }

  getAll() async {
    isLoading = true;
    final url = Uri.https(Constants.baseUrl, 'Notes.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> map = json.decode(response.body);
      map.forEach((key, value) {
        final model = Notes.fromJson(value);
        model.id = key;
        notes.add(model);
      });
    }
    isLoading = false;
    notifyListeners();
  }
}
